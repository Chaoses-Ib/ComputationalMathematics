# Hash Tables
[Wikipedia](https://en.wikipedia.org/wiki/Hash_table)

[data structures - How does a hash table work? - Stack Overflow](https://stackoverflow.com/questions/730620/how-does-a-hash-table-work)

[java - Why Are HashMaps Implemented Using Powers of Two? - Stack Overflow](https://stackoverflow.com/questions/53526790/why-are-hashmaps-implemented-using-powers-of-two)

[dictionary - An efficient Map of elements with continuous integer keys in Java - Stack Overflow](https://stackoverflow.com/questions/55279761/an-efficient-map-of-elements-with-continuous-integer-keys-in-java)
- [Sparse Arrays](../Sparse/Arrays.md)

## Collision resolution
- Seperate chaining

- Open addressing

  Since the slots are located in successive locations, linear probing could lead to better utilization of CPU cache due to locality of references resulting in reduced memory latency.

  The performance of open addressing may be slower compared to separate chaining since the probe sequence increases when the load factor approaches 1.

  - Linear probing
  
  - Quadratic probing
  
  - Double hashing

- Coalesced hashing

- Cuckoo hashing

- Hopscotch hashing

- Robin Hood hashing

## Implementations
[An Analysis of Hash Map Implementations in Popular Languages](https://rcoh.me/posts/hash-map-analysis/)

- [`dense_hash_map<Key, Data, HashFcn, EqualKey, Alloc>`](https://goog-sparsehash.sourceforge.net/doc/dense_hash_map.html)

- [sparsehash: C++ associative containers](https://github.com/sparsehash/sparsehash)
  - `sparse_hash_map` has memory overhead of about 4 to 10 bits per hash-map entry, assuming a typical average occupancy of 50%.
  - `dense_hash_map` has a factor of 2-3 memory overhead: if your hashtable data takes X bytes, `dense_hash_map` will use 3X-4X memory total.

### Seperate chaining
- `ska::bytell_hash_map`

  [A new fast hash table in response to Google’s new fast hash table | Probably Dance](https://probablydance.com/2018/05/28/a-new-fast-hash-table-in-response-to-googles-new-fast-hash-table/)

### Open addressing
- Swiss tables

  [abseil / Swiss Tables Design Notes](https://abseil.io/about/design/swisstables)

  Rust: [→hashbrown](https://github.com/Chaoses-Ib/Rust/blob/main/Libraries/Data%20Structures.md#hash-tables)

- `ska::flat_hash_map`

  [I Wrote The Fastest Hashtable | Probably Dance](https://probablydance.com/2017/02/26/i-wrote-the-fastest-hashtable/)