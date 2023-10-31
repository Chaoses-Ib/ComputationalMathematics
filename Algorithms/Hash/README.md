# Hash Tables
[Wikipedia](https://en.wikipedia.org/wiki/Hash_table)

[data structures - How does a hash table work? - Stack Overflow](https://stackoverflow.com/questions/730620/how-does-a-hash-table-work)

[java - Why Are HashMaps Implemented Using Powers of Two? - Stack Overflow](https://stackoverflow.com/questions/53526790/why-are-hashmaps-implemented-using-powers-of-two)

[The stable HashMap trap | More Stina Blog!](https://morestina.net/blog/1843/the-stable-hashmap-trap)

[dictionary - An efficient Map of elements with continuous integer keys in Java - Stack Overflow](https://stackoverflow.com/questions/55279761/an-efficient-map-of-elements-with-continuous-integer-keys-in-java)
- [Sparse Arrays](../Sparse/Arrays.md)

## [→Non-cryptographic hash functions](https://github.com/Chaoses-Ib/Cryptology#non-cryptographic-hash-functions)

## Collision resolution
### [→Seperate chaining](Seperate%20Chaining.md)

### [→Open Addressing](Open%20Addressing.md)

### Others
- Coalesced hashing

- Cuckoo hashing

- Hopscotch hashing

- Robin Hood hashing

## Implementations
[An Analysis of Hash Map Implementations in Popular Languages](https://rcoh.me/posts/hash-map-analysis/)

Rust:
- [std::collections::HashMap](https://doc.rust-lang.org/stable/std/collections/struct.HashMap.html)

  [Storing Keys with Associated Values in Hash Maps - The Rust Programming Language](https://doc.rust-lang.org/book/ch08-03-hash-maps.html)

- [rt_map: Runtime managed mutable borrowing from a map.](https://github.com/azriel91/rt_map)

  ```rust
  pub struct RtMap<K, V>(HashMap<K, Cell<V>>);
  ```

### Concurrent
Rust:
- [DashMap: Blazing fast concurrent HashMap for Rust.](https://github.com/xacrimon/dashmap)
  - [Document single-threaded deadlock behavior - Issue #74 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/74)
  - [Document deadlock conditions - Issue #233 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/233)

    > **Locking behavior:** May deadlock if called when **the current thread is** holding any sort of reference into the map.
  - [Key-level guarantees - Issue #253 - xacrimon/dashmap](https://github.com/xacrimon/dashmap/issues/253)

- `HashMap<K, usize> + RwLock<Vec<V>>`

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
- [linked-hash-map: A HashMap wrapper that holds key-value pairs in insertion order](https://github.com/contain-rs/linked-hash-map)

### Perfect
Rust:
- [Rust-PHF: Compile time static maps for Rust](https://github.com/rust-phf/rust-phf)