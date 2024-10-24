# Tries
[Wikipedia](https://en.wikipedia.org/wiki/Trie)

A **trie** (/ˈtriː/, /ˈtraɪ/), also called **digital tree** or **prefix tree**, is a type of k-ary search tree, a tree data structure used for locating specific keys from within a set. These keys are most often strings, with links between nodes defined not by the entire key, but by individual characters. In order to access a key (to recover its value, change it, or remove it), the trie is traversed depth-first, following the links between nodes, which represent each character in the key.

[Implement Trie (Prefix Tree) - LeetCode](https://leetcode.com/problems/implement-trie-prefix-tree/description/)

## Bitwise tries
A **bitwise trie** is a special form of trie where each node with its child-branches represents a bit sequence of one or more bits of a key

- Bitwise tries with bitmap ([Wikipedia](https://en.wikipedia.org/wiki/Bitwise_trie_with_bitmap))

  A bitwise trie with bitmap uses a bitmap to denote valid child branches.

## Replacement for hash tables
A trie can be used to replace a hash table, over which it has the following advantages:

- Searching for a node with an associated key of size $m$ has the complexity of $O(m)$, whereas an imperfect hash function may have numerous colliding keys, and the worst-case lookup speed of such a table would be $O(N)$, where $N$ denotes the total number of nodes within the table.

- Tries do not need a hash function for the operation, unlike a hash table; there are also no collisions of different keys in a trie.

- Buckets in a trie, which are analogous to hash table buckets that store key collisions, are necessary only if a single key is associated with more than one value.

- String keys within the trie can be sorted using a predetermined alphabetical ordering.

However, tries are less efficient than a hash table when the data is directly accessed on a secondary storage device such as a hard disk drive that has higher random access time than the main memory. Tries are also disadvantageous when the key value cannot be easily represented as string, such as floating point numbers where multiple representations are possible (e.g. 1 is equivalent to 1.0, +1.0, 1.00, etc.), however it can be unambiguously represented as a binary number in IEEE 754, in comparison to two's complement format.

## Implementations
Rust:
- [Two trie implementations in Rust (one's super fast) - DEV Community](https://dev.to/timclicks/two-trie-implementations-in-rust-ones-super-fast-2f3m)
- [Trie tree implementation with Rust.](https://gist.github.com/MikuroXina/cb16242aa80791901f04e8fff8a86956)
- [trie-rs: Memory efficient trie (prefix tree) library based on LOUDS](https://github.com/laysakura/trie-rs)
  - [Getting direct children of a node - Issue #35](https://github.com/laysakura/trie-rs/issues/35)
- [qp-trie-rs: An idiomatic and fast QP-trie implementation in pure Rust.](https://github.com/sdleffler/qp-trie-rs)
- [Yada: A yet another double-array trie library aiming for fast search and compact data representation.](https://github.com/takuyaa/yada)
- [sequence\_trie: Ergonomic trie data structure](https://github.com/michaelsproul/rust_sequence_trie) (discontinued)
  - [radix\_trie: Fast generic radix trie implemented in Rust](https://github.com/michaelsproul/rust_radix_trie) (discontinued)
- [GTrie: Library implementing the prefix tree in Rust](https://github.com/aserebryakov/trie-rs) (discontinued)
- [trying: Provides a simple Trie implementation for storing "keys" composed of "atoms".](https://github.com/garypen/trying)
- [basic\_trie: A simple Trie implementation in Rust](https://github.com/lukascobbler/basic_trie)
  - `&str`
- [simple\_trie](https://docs.rs/simple_trie/latest/simple_trie/)
