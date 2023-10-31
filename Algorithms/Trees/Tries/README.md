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