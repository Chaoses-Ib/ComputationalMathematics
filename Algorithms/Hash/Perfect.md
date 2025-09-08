# Perfect Hashing
[Wikipedia](https://en.wikipedia.org/wiki/Perfect_hash_function)

- Perfect hash table don't have collision so it can be faster than other hash tables.
- But it still can be slower than `switch`, as using hash tables introduces long data dependency + memory barrier.

[Throw away the keys: Easy, Minimal Perfect Hashing](https://stevehanov.ca/blog/?id=119)

[Minimal perfect hash functions - Randorithms](https://randorithms.com/2019/09/12/MPH-functions.html)

[I'm about to release in production a 7k+ lines long match expression. Help me realise whether it's a good idea before it's too late. : r/rust](https://www.reddit.com/r/rust/comments/1agnojr/im_about_to_release_in_production_a_7k_lines_long/)

## Algorithms
- Compressed hash-and-displace (CHD)[^belazzouguiHashDisplaceCompress2009]

## Minimal
Modern Minimal Perfect Hashing: A Survey[^lehmannModernMinimalPerfect2025] ([Hacker News](https://news.ycombinator.com/item?id=44241832))

- PtrHash: Minimal Perfect Hashing at RAM Throughput[^grootkoerkampPtrHashMinimalPerfect2025]
  - > PtrHash is primarily intended to be used on large sets of keys, say of size at least 1 million. Nevertheless, it can also be used for sets as small as e.g. 10 keys. In this case, there will be a relatively large constant space overhead, and other methods may be smaller and/or faster.
    - `index()` needs a lot of calculation
  - Rust: [PtrHash: PtrHash minimal perfect hash function](https://github.com/RagnarGrootKoerkamp/ptrhash)
    - Deserialize/`new` is non-const
    - v2 is faster than v1
    - [Make `gxhash` optional - Issue #25](https://github.com/RagnarGrootKoerkamp/PtrHash/issues/25)

## Limited perfect hashing
Limited perfect hashing, false lookup.

Unique hashes for the given set, arbitary (but better out of known hashes) hashes for others. So known input will have no collision.
- Key must be checked if hashes of unknown input are not guaranteed to be out of known hashes.
  - Always a memory lookup
- If the hash table supports mapping multiple keys to the same slot, a sentinel value can also be used.
  - But if there are too many unknown keys, it may be very hard to find a perfect hash function.
- Simply adding many sentinel values can also be used to check invalid inputs, at the cost of some space.
- Bloom filter

[data structures - Perfect Hash Function: How does it cope with lookups outside the set of keys? - Computer Science Stack Exchange](https://cs.stackexchange.com/questions/115683/perfect-hash-function-how-does-it-cope-with-lookups-outside-the-set-of-keys)

[Perfect Hash Function that detects invalid inputs? - Mathematics Stack Exchange](https://math.stackexchange.com/questions/4155502/perfect-hash-function-that-detects-invalid-inputs)

## Implementations
- LLVM

  [What if match statetement could generate perfect hash function - language design - Rust Internals](https://internals.rust-lang.org/t/what-if-match-statetement-could-generate-perfect-hash-function/19222)

  [Match statement efficiency? - The Rust Programming Language Forum](https://users.rust-lang.org/t/match-statement-efficiency/4488)

Rust:
- [Rust-PHF: Compile time static maps for Rust](https://github.com/rust-phf/rust-phf)
  - [Allow hashers other than SipHasher - Issue #88](https://github.com/rust-phf/rust-phf/issues/88)
  - [Use a better MPHF algorithm - Issue #349](https://github.com/rust-phf/rust-phf/issues/349)

    > Counterintuitively, it is not easy to make PHF faster than HashMap, because PHF needs to have a more complex dispace strategy. The biggest advantage of PHF is that PHF can guarantee that the key is conflict-free, but this advantage is not significant, because HashMap does not have serious conflicts under average expectation.
    > 
    > It took me some effort to do this, and my crate is now faster than `std::collections::HashMap` for single query (use same hasher), but traversal query are still slower (because cache miss). see [swc-project/swc#10712 (comment)](https://github.com/swc-project/swc/pull/10712#issuecomment-3034667423) and [quininer/precomputed-map#:~:text=comparison%20data](https://github.com/quininer/precomputed-map/?rgh-link-date=2025-07-14T07%3A01%3A12.000Z#:~:text=comparison%20data)

  [Why is phf::Map slower than std HashMap? - The Rust Programming Language Forum](https://users.rust-lang.org/t/why-is-phf-map-slower-than-std-hashmap/97339)
- [quininer/precomputed-map](https://github.com/quininer/precomputed-map)

C++:
- [mph: C++20 \[Minimal\] Static Perfect Hash library](https://github.com/qlibs/mph)


[^lehmannModernMinimalPerfect2025]: Lehmann, H.-P., Mueller, T., Pagh, R., Pibiri, G. E., Sanders, P., Vigna, S., & Walzer, S. (2025). Modern Minimal Perfect Hashing: A Survey (No. arXiv:2506.06536). arXiv. https://doi.org/10.48550/arXiv.2506.06536
[^belazzouguiHashDisplaceCompress2009]: Belazzougui, D., Botelho, F. C., & Dietzfelbinger, M. (2009). Hash, Displace, and Compress. In A. Fiat & P. Sanders (Eds.), Algorithms—ESA 2009 (pp. 682–693). Springer. https://doi.org/10.1007/978-3-642-04128-0_61
[^grootkoerkampPtrHashMinimalPerfect2025]: Groot Koerkamp, R. (2025). PtrHash: Minimal Perfect Hashing at RAM Throughput. In P. Mutzel & N. Prezza (Eds.), 23rd International Symposium on Experimental Algorithms (SEA 2025) (Vol. 338, p. 21:1-21:21). Schloss Dagstuhl – Leibniz-Zentrum für Informatik. https://doi.org/10.4230/LIPIcs.SEA.2025.21
