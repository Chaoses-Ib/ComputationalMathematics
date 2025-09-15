# Hash Tables
[Wikipedia](https://en.wikipedia.org/wiki/Hash_table)

[data structures - How does a hash table work? - Stack Overflow](https://stackoverflow.com/questions/730620/how-does-a-hash-table-work)

[java - Why Are HashMaps Implemented Using Powers of Two? - Stack Overflow](https://stackoverflow.com/questions/53526790/why-are-hashmaps-implemented-using-powers-of-two)

[The stable HashMap trap | More Stina Blog!](https://morestina.net/blog/1843/the-stable-hashmap-trap)

[How to optimize really large hashmaps? : r/rust](https://www.reddit.com/r/rust/comments/z0mgfx/how_to_optimize_really_large_hashmaps/)
- > High hash function quality implies perfect random distribution. Presumably, on large hashmaps, perfect random distribution implies an extremely high cache miss rate. To verify this assumption, I conducted a [benchmark](https://github.com/QuarticCat/hashbrown-benchmark), showing the huge impact of hashmap sizes on the performance.
- > 以 size 作为 x 轴你会发现在超出三缓大小后延迟会急剧上升
- Locality-sensitive hashes

[dictionary - An efficient Map of elements with continuous integer keys in Java - Stack Overflow](https://stackoverflow.com/questions/55279761/an-efficient-map-of-elements-with-continuous-integer-keys-in-java)
- [Sparse Arrays](../Sparse/Arrays.md)

[Scientists Find Optimal Balance of Data Storage and Time | Quanta Magazine](https://www.quantamagazine.org/scientists-find-optimal-balance-of-data-storage-and-time-20240208/)
- [奇客Solidot | 科学家找到数据存储和时间的最佳平衡](https://www.solidot.org/story?sid=77340)

  > 1953 年 IBM 科学家 Hans Peter Luhn 提出了一种存储和检索信息的新方法，它就是哈希表（hash table），如今已内置在几乎所有计算机系统中。哈希表是历史最悠久、速度最快、最简单且使用最广泛的数据结构之一，它设计执行三个操作：插入，在数据库里加入新条目；查询，获取一个条目或检查该条目是否存在；删除。Chrome 或 Safari 等浏览器可能内置了多个哈希表去跟踪不同类的数据。哈希表不可避免的存在权衡取舍。1957 年另一位 IBM 计算机科学家 W. Wesley Peterson 指出了哈希表面临的技术挑战：需要足够快以快速检索必要的信息，需要紧凑使用尽可能少的内存。两个目标从根本上是矛盾的：哈希表有更多内存时能更快访问和修改数据库，哈希表使用更少空间时操作会很慢。几十年来，研究人员一直在寻找哈希表时间和空间的最佳平衡。2022 年纽约石溪大学的 Michael Bender 等人发表论文，提出了一种具有时间和空间效率最佳组合的新哈希表。2023 年普林斯顿大学 Huacheng Yu 领导的一个团队证明 Bender 的哈希表是理论上的最优解。由于新哈希表太复杂，还没人尝试在短时间去构建，而且理论上快的算法在实践中未必快。

## [→Non-cryptographic hash functions](https://github.com/Chaoses-Ib/Cryptology#non-cryptographic-hash-functions)

## Collision resolution
### [→Seperate chaining](Seperate%20Chaining.md)

### [→Open Addressing](Open%20Addressing.md)

### Others
- Coalesced hashing

- Cuckoo hashing

- Hopscotch hashing

- Robin Hood hashing

### [→Perfect hashing](Perfect.md)

## Implementations
- [ ] Whole process hash table

[An Analysis of Hash Map Implementations in Popular Languages](https://rcoh.me/posts/hash-map-analysis/)

C++:
- [An Extensive Benchmark of C and C++ Hash Tables | A comparative, extendible benchmarking suite for C and C++ hash-table libraries.](https://jacksonallan.github.io/c_cpp_hash_tables_benchmark/) ([Lobste.rs](https://lobste.rs/s/agihne/extensive_benchmark_c_c_hash_tables))
- [Looking up a C++ Hash Table with a pre-known hash](https://ebadblog.com/looking-up-a-c++-hash-table-with-a-pre-known-hash) ([r/cpp](https://www.reddit.com/r/cpp/comments/1cy0mg9/looking_up_a_c_hash_table_with_a_preknown_hash/))

Rust:
- [std::collections::HashMap](https://doc.rust-lang.org/stable/std/collections/struct.HashMap.html)

  [Storing Keys with Associated Values in Hash Maps - The Rust Programming Language](https://doc.rust-lang.org/book/ch08-03-hash-maps.html)

- [rt_map: Runtime managed mutable borrowing from a map.](https://github.com/azriel91/rt_map)

  ```rust
  pub struct RtMap<K, V>(HashMap<K, Cell<V>>);
  ```

### Concurrent
- [DLHT: A Non-blocking Resizable Hashtable with Fast Deletes and Memory-awareness](https://dl.acm.org/doi/10.1145/3625549.3658682)

  > 粗略扫了一眼，直觉上在低竞争的情况下打不过 dashmap

Rust:
- [DashMap: Blazing fast concurrent HashMap for Rust.](https://github.com/xacrimon/dashmap)

  > dashmap 很简单的，就 N 个 hashbrown ，每个上一个锁，用 hash value 来决定一个 key 分配到哪个 hashbrown 里

  - [Document single-threaded deadlock behavior - Issue #74 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/74)
  - [Document deadlock conditions - Issue #233 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/233)

    > **Locking behavior:** May deadlock if called when **the current thread is** holding any sort of reference into the map.
  - [Key-level guarantees - Issue #253 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/253)

  Libraries:
  - [waitmap](https://github.com/withoutboats/waitmap)

    [waitmap - an async awaitable map](https://boats.gitlab.io/blog/post/waitmap/)

- `HashMap<K, usize> + RwLock<Vec<V>>`

- [papaya: A fast and ergonomic concurrent hash-table for read-heavy workloads.](https://github.com/ibraheemdev/papaya)

  [papaya: a fast and ergonomic concurrent hash-table for read-heavy workloads : r/rust](https://www.reddit.com/r/rust/comments/1dzrz31/papaya_a_fast_and_ergonomic_concurrent_hashtable/)

  [Designing A Fast Concurrent Hash Table](https://ibraheem.ca/posts/designing-papaya/) ([r/rust](https://www.reddit.com/r/rust/comments/1g0g4ac/designing_a_fast_concurrent_hash_table), [Hacker News](https://news.ycombinator.com/item?id=41798475))

- [scalable-concurrent-containers: High performance containers and utilities for concurrent and asynchronous programming](https://github.com/wvwwvwwv/scalable-concurrent-containers/)

  [Choosing a concurrent map - wvwwvwwv/scalable-concurrent-containers - Discussion #113](https://github.com/wvwwvwwv/scalable-concurrent-containers/discussions/113#discussioncomment-7258390)
  > 按照 scc 的作者的说法，如果负荷比较小，dashmap 更好，负荷大的话 scc 更好

- [concurrent-map: lock-free B+ tree](https://github.com/komora-io/concurrent-map)

- [Leapfrog: Lock-free concurrent and single-threaded hash map implementations using Leapfrog probing.](https://github.com/robclu/leapfrog)

- [flashmap: A lock-free, partially wait-free, eventually consistent, concurrent hashmap.](https://github.com/Cassy343/flashmap)

  ```rust
  pub struct Core<K, V, S = DefaultHashBuilder> {
      residual: AtomicIsize,
      refcounts: Mutex<Slab<NonNull<RefCount>>>,
      writer_thread: UnsafeCell<Option<Thread>>,
      writer_map: Cell<MapIndex>,
      maps: OwnedMapAccess<K, V, S>,
      _not_sync: PhantomData<*const u8>,
  }
  ```

  ```rust
  pub struct ReadHandle<K, V, S = RandomState> {
      core: Arc<Core<K, V, S>>,
      map_access: SharedMapAccess<K, V, S>,
      refcount: NonNull<RefCount>,
      refcount_key: usize,
  }
  ```

  ```rust
  pub struct WriteHandle<K, V, S = RandomState>
  where
      K: Hash + Eq,
      S: BuildHasher,
  {
      core: Arc<Core<K, V, S>>,
      operations: UnsafeCell<Vec<Operation<K, V>>>,
      uid: WriterUid,
  }
  ```

- [flurry: A port of Java's ConcurrentHashMap to Rust](https://github.com/jonhoo/flurry)

- [cht: Lockfree resizeable concurrent hash table.](https://github.com/Gregory-Meyer/cht)
  - [moka-cht: Lock-free resizable concurrent hash table](https://github.com/moka-rs/moka-cht)

- [folklore: A lock-less concurrent hash map](https://github.com/callumbirks/folklore/)

[conc-map-bench](https://github.com/xacrimon/conc-map-bench)
- [robclu/conc-map-bench: Fork of rust concurrent hash map bencmarks to include leapfrog map.](https://github.com/robclu/conc-map-bench)

### Compact
[Compact Hash Table Benchmark](https://github.com/koeppl/hashbench)

C++:
- [`dense_hash_map<Key, Data, HashFcn, EqualKey, Alloc>`](https://goog-sparsehash.sourceforge.net/doc/dense_hash_map.html)

- [sparsehash: C++ associative containers](https://github.com/sparsehash/sparsehash)
  - `sparse_hash_map` has memory overhead of about 4 to 10 bits per hash-map entry, assuming a typical average occupancy of 50%.
  - `dense_hash_map` has a factor of 2-3 memory overhead: if your hashtable data takes X bytes, `dense_hash_map` will use 3X-4X memory total.

Rust:
- [Compressed maps without the keys, based on frayed ribbon cascades](https://github.com/bitwiseshiftleft/compressed_map)

### Small
Rust:
- [micromap: 📈 A much faster (for very small maps!) alternative of Rust HashMap, which doesn't use hashing and doesn't use heap](https://github.com/yegor256/micromap)

- [litemap: a highly simplistic “flat” key-value map based off of a single sorted vector](https://docs.rs/litemap/latest/litemap/)

[micromap Benchmark](https://github.com/yegor256/micromap#benchmark)

[The World's Smallest Hash Table | orlp.net](https://orlp.net/blog/worlds-smallest-hash-table/)

### Ordered
Rust:
- [indexmap: A hash table with consistent order and fast iteration; access items by key or sequence index](https://github.com/bluss/indexmap)

  ```rust
  pub(crate) struct IndexMapCore<K, V> {
      /// indices mapping from the entry hash to its index.
      indices: RawTable<usize>,
      /// entries is a dense vec of entries in their order.
      entries: Vec<Bucket<K, V>>,
  }
  ```
  When $(1-p)V > I$ or $p < 1-{I \over V}$,
  $$(K + V + H) \cdot n/p > (K + I + H) \cdot n/p + V \cdot n $$
  i.e. the index map will be smaller than the normal map.

- [linked-hash-map: A HashMap wrapper that holds key-value pairs in insertion order](https://github.com/contain-rs/linked-hash-map)

### On-disk
Rust:
- [rust-lang/odht: An on-disk hash table implementation](https://github.com/rust-lang/odht)
