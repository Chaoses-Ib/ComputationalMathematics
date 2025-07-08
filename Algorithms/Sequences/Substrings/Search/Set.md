# String-set-searching Algorithms
## Aho–Corasick algorithm
[Wikipedia](https://en.wikipedia.org/wiki/Aho%E2%80%93Corasick_algorithm)

Extension of Knuth-Morris-Pratt.

[aho-corasick should be applied for cases like `\b(literal1|literal2|...|literalN)\b` - Issue #891 - rust-lang/regex](https://github.com/rust-lang/regex/issues/891)

Rust:
- [BurntSushi/aho-corasick: A fast implementation of Aho-Corasick in Rust.](https://github.com/BurntSushi/aho-corasick) ([Docs.rs](https://docs.rs/aho-corasick/latest/aho_corasick/))
  - ASCII case insensitivity
    - ~~[Tracking issue for full-unicode case-insensitive matching - Issue #70](https://github.com/BurntSushi/aho-corasick/issues/70)~~
  - Much faster (-70%) than `regex` for literal string search
  - Used by regex
- [fuzzy-aho-corasick-rs: Fuzzy Aho---Corasick implemented in Rust](https://github.com/kakserpom/fuzzy-aho-corasick-rs) ([Docs.rs](https://docs.rs/fuzzy-aho-corasick/latest/fuzzy_aho_corasick/))

## Commentz-Walter algorithm
[Wikipedia](https://en.wikipedia.org/wiki/Commentz-Walter_algorithm)

Extension of Boyer-Moore.
