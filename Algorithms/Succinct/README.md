# Succinct Data Structures
[Wikipedia](https://en.wikipedia.org/wiki/Succinct_data_structure)

[Secret Weblog - Succinct data structures](https://blog.startifact.com/posts/succinct/) ([Hacker News](https://news.ycombinator.com/item?id=43282995))
- Bit vector
- Rank/select bit vector
- Wavelet matrix/tree
- FM-index
- Balanced parentheses tree

[Succinct Trie Indexes Made Practical](http://www.cs.cmu.edu/~huanche1/slides/FST.pdf)
- Implicit: $L+O(1)$
- Succinct: $L+o(L)$
- Compact: $O(L)$
  - Fast succinct trie

Applications:
- DNA
- AST

## Libraries
### Rust
- [vers: Succinct data structures using very efficient rank and select](https://github.com/Cydhra/vers)
- [sucds: Collection of succinct data structures in Rust](https://github.com/kampersanda/sucds)

## FM-index
Rust:
- [ajalab/fm-index: FM-Index for Rust](https://github.com/ajalab/fm-index)
