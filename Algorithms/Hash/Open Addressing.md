# Open Addressing
[Wikipedia](https://en.wikipedia.org/wiki/Open_addressing)

The performance of open addressing may be slower compared to separate chaining since the probe sequence increases when the load factor approaches.

- Linear probing
- Quadratic probing
- Double hashing

The main trade offs between these methods are that:
- Linear probing has the **best cache performance** but is most **sensitive to clustering**.
  
- Double hashing has **poor cache performance** but exhibits virtually **no clustering**.

  Double hashing can also require more computation than other forms of probing.

- Quadratic probing falls **in-between in both areas**.

## Linear probing
The average cost of linear probing depends on the hash function's ability to distribute the elements **uniformly** throughout the table to avoid clustering, since formation of clusters would result in increased search time.

- Standard linear probing
- Bidirectional linear probing[^blp]

  [Compact Sparse Hash Table: A blend of the compact and sparse hash table implementations.](https://github.com/tudocomp/compact_sparse_hash)

  [Designing a Fast, Efficient, Cache-friendly Hash Table, Step by Step (2017) | Lobsters](https://lobste.rs/s/hxvcpa/designing_fast_efficient_cache_friendly)

[hashtable-benchmarks: An Evaluation of Linear Probing Hashtable Algorithms](https://github.com/senderista/hashtable-benchmarks)

[^blp]: Amble, O., and D. E. Knuth. “Ordered Hash Tables.” The Computer Journal 17, no. 2 (January 1, 1974): 135–42. https://doi.org/10.1093/comjnl/17.2.135.

## Quadratic probing
[Wikipedia](https://en.wikipedia.org/wiki/Quadratic_probing)

Quadratic probing can be a more efficient algorithm in an open addressing table, since it **better avoids the clustering** problem that can occur with linear probing, although it is not immune. It also provides **good memory caching** because it preserves some locality of reference; however, linear probing has greater locality and, thus, better cache performance.

### Full cycle by $m=2^n$

### Full cycle by $m=n^p$

### Full cycle by rounding up $m$ to $M=2^n$
For any $m$, full cycle with quadratic probing can be achieved by rounding up $m$ to closest power of $2$, compute probe index:

$$h(k,i)=h(k)+((i^2+i)/2) \pmod{\text{roundUp2}(m)}$$

and skip iteration when $h(k,i)\ge m$.

There is maximum $\text{roundUp2}(m)-m < {m\over 2}$ skipped iterations, and these iterations do not refer to memory, so it is fast operation on most modern processors.[^quadratic]

A simple implementation:
```rust
struct ProbeSeq {
    pos: usize,
    stride: usize,
}

impl ProbeSeq {
    fn move_next(&mut self, bucket_size: usize, bucket_next_power_of_two_mask: usize) {
        debug_assert!(self.stride <= bucket_next_power_of_two_mask);

        // example::ProbeSeq::move_next:
        //         mov     rax, qword ptr [rdi]
        //         mov     rcx, qword ptr [rdi + 8]
        // .LBB0_1:
        //         add     rax, rcx
        //         add     rax, 8
        //         add     rcx, 8
        //         and     rax, rdx
        //         cmp     rax, rsi
        //         jae     .LBB0_1
        //         mov     qword ptr [rdi + 8], rcx
        //         mov     qword ptr [rdi], rax
        //         ret
        loop {
            self.stride += Group::WIDTH;
            self.pos += self.stride;
            self.pos &= bucket_next_power_of_two_mask;
            if likely(self.pos < bucket_size) {
                break;
            }
        }
    }
}
```

Let $M=\text{roundUp2}(m)$, given

$$h+{1\over 2}\sum_i^j{(i^2+i)} \ge M$$

we can get

$$j^3+3j^2+2j = j(j+1)(j+2) \ge C = 6(M-h) + i^3-i$$

We can use binary search to find the minimum $j$ satisfying this relationship:

```rust
fn min_j(i: usize, c: usize) -> usize {
    let mut low = i;
    // 2642245 * (2642245 + 1) * (2642245 + 2) > usize::MAX
    let mut high = min(c, 2642244);
    while low <= high {
        let mid = (low + high) / 2;
        if mid * (mid + 1) * (mid + 2) < c {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    low
}
```

Because

$$j<M$$

and

$$C-M = -h + 5(M-h) + i(i^2-1)$$

$C$ is only smaller than $M$ when $h > {5\over 6}M - {1\over 6}i(i^2-1)$, using $M$ as `high` may give better performance.

```rust
fn min_j(i: usize, m: usize, c: usize) -> usize {
    let mut low = i;
    let mut high = min(m - 1, c);
    while low <= high {
        let mid = (low + high) / 2;
        if mid * (mid + 1) * (mid + 2) < c {
            low = mid + 1;
        } else {
            high = mid - 1;
        }
    }
    low
}
```

The full implementation:

```rust
impl ProbeSeq {
    fn move_next(&mut self, bucket_size: usize, bucket_next_power_of_two_mask: usize) {
        debug_assert!(self.stride <= bucket_next_power_of_two_mask);

        self.stride += Group::WIDTH;
        self.pos += self.stride;
        self.pos &= bucket_next_power_of_two_mask;
        while unlikely(self.pos >= bucket_size.get()) {
            debug_assert_eq!(self.stride % Group::WIDTH, 0);
            let i = self.stride / Group::WIDTH + 1;

            let h = self.pos / Group::WIDTH;
            let m = (bucket_next_power_of_two_mask + 1) / Group::WIDTH;
            let b = i * i * i - i;
            let c = 6 * (m - h) + b;
            let j = min_j(i, m, c);
            debug_assert!(j * (j + 1) * (j + 2) >= c && c > (j - 1) * j * (j + 1));
            debug_assert!(j >= i);

            self.stride += (j - i) * Group::WIDTH;
            self.pos += (j * (j * (j + 3) + 2) - b) / 6 * Group::WIDTH;
            debug_assert!(self.pos >= bucket_next_power_of_two_mask + 1);
            self.pos &= bucket_next_power_of_two_mask;
        }
    }
}
```

However, this implementation is slower than the simple implementation.

[^quadratic]: [Quadratic probing - Wikipedia](https://en.wikipedia.org/wiki/Quadratic_probing)

## Double hashing

## Lazy deletion
[Wikipedia](https://en.wikipedia.org/wiki/Lazy_deletion)

## Implementations
- Swiss tables

  [abseil / Swiss Tables Design Notes](https://abseil.io/about/design/swisstables)

  - [hashbrown](https://github.com/rust-lang/hashbrown) (Rust)

    [Swisstable, a Quick and Dirty Description - Faultlore](https://faultlore.com/blah/hashbrown-tldr/)

    [The Swiss Army Knife of Hashmaps | Arrow of Code](https://blog.waffles.space/2018/12/07/deep-dive-into-hashbrown/)

    [Replace HashMap implementation with SwissTable (as an external crate) by Amanieu · Pull Request #58623 · rust-lang/rust](https://github.com/rust-lang/rust/pull/58623)

    Memory usage:
    - `(capacity() * 8 / 7).next_power_of_two() * (sizeof((K, V)) + sizeof(u8))` ([hashbrown/src/raw/mod.rs](https://github.com/rust-lang/hashbrown/blob/f2e62124cd947b5e2309dd6a24c7e422932aae97/src/raw/mod.rs#L195-L217))

      Actually the `next_power_of_two()` plays a more important role in the final size. For example, if we reserve a capacity of 917,505, given the load factor, the map needs 1,048,577 buckets, but `next_power_of_two()` then makes it 2,097,152 buckets, and the utilization rate is only 43.75% (if we only need to store 917,505 items).
    - [Worse memory usage than old stdlib hashmap due to growth factor differences. · Issue #304 · rust-lang/hashbrown](https://github.com/rust-lang/hashbrown/issues/304)
    - [Measuring the overhead of HashMaps in Rust | nicole@web](https://ntietz.com/blog/rust-hashmap-overhead/)
    - [Measure the memory usage of HashMap better · Issue #6908 · servo/servo](https://github.com/servo/servo/issues/6908)

    [Plans for `node_hash_map` · Issue #234 · rust-lang/hashbrown](https://github.com/rust-lang/hashbrown/issues/234)

- `ska::flat_hash_map`

  [I Wrote The Fastest Hashtable | Probably Dance](https://probablydance.com/2017/02/26/i-wrote-the-fastest-hashtable/)