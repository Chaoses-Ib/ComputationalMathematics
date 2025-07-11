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
  - Sorting patterns can make `build()` faster (~-14%)
  - Doesn't check duplicate patterns
  - [Feat Req: Making it easier to statically construct an AcAutomaton - Issue #9](https://github.com/BurntSushi/aho-corasick/issues/9)
    - [Persist automaton to file such that it can be saved to disk and loaded back in memory - Issue #22](https://github.com/BurntSushi/aho-corasick/issues/22)
      - [Serializing pre-built automaton - Issue #105](https://github.com/BurntSushi/aho-corasick/issues/105)
  - Used by regex
- [daachorse: 🐎 A fast implementation of the Aho-Corasick algorithm using the compact double-array data structure in Rust.](https://github.com/daac-tools/daachorse)
  - > The performance of daachorse is impressive, even with a single pattern it is faster than `std::str::find()` and `aho-corasick` according to my benchmark.
  - Supports serialization, much faster than build, though the size is a little large
  - Doesn't support anchored matching
  - [ASCII case-insensitive matching - Issue #109](https://github.com/daac-tools/daachorse/issues/109)

  burntsushi:
  > Note that it's not a DFA. If your search implementation has a loop over failure transitions, then it's an NFA. daachorse has that loop: <https://github.com/daac-tools/daachorse/blob/2d7999a79fbcebd573517dce883b280f29627a45/src/bytewise.rs#L668-L706>
  > 
  > Which is indeed generally what you want for Aho-Corasick, because the DFA is quite large.
  > 
  > The [`aho-corasick` crate does have a real DFA](https://docs.rs/aho-corasick/latest/aho_corasick/dfa/struct.DFA.html) if you need the fastest possible search speed, but its memory usage and build times are exorbitant.
- [fuzzy-aho-corasick-rs: Fuzzy Aho---Corasick implemented in Rust](https://github.com/kakserpom/fuzzy-aho-corasick-rs) ([Docs.rs](https://docs.rs/fuzzy-aho-corasick/latest/fuzzy_aho_corasick/))

## Commentz-Walter algorithm
[Wikipedia](https://en.wikipedia.org/wiki/Commentz-Walter_algorithm)

Extension of Boyer-Moore.
