# Range Maps
- Bitmaps + index map

## Rust
[Benchmarks for (some) Range-Related Rust Crates (Maps only)](https://github.com/CarlKCarlK/range-set-blaze/blob/main/docs/bench_map.md)

- [rangemap: Map data structure whose keys are stored as ranges](https://github.com/jeffparsons/rangemap) ([Docs.rs](https://docs.rs/rangemap/latest/rangemap/))
  - `BTreeMap`
  - Query, remove, invert, min/max, intersection, union
  - Used by lance-table, LibAFL, cosmic-text
  - [ecclarke42/segmap: Map data structure whose keys are stored as ranges](https://github.com/ecclarke42/segmap)
- [range-set-blaze: Integer sets as fast, sorted, integer ranges with full set operations](https://github.com/CarlKCarlK/range-set-blaze)
  - `BTreeMap`
  - Query, iter, min/max, remove, reatin, split
- [nodit: This crate provides Discrete Interval Tree Data-Structures, which are based off BTreeMap](https://github.com/ripytide/nodit) ([Docs.rs](https://docs.rs/nodit/))
  - `BTreeMap`
  - Query (point/range), iter, invert, min/max, remove
- [`range_map_vec`: A Rust crate that implements a range map data structure backed by a Vec.](https://github.com/microsoft/range_map_vec)
  - `Vec` + binary search
  - Must be inserted in order
- [iset: Rust crates with map and set with interval keys (ranges x..y).](https://github.com/tprodanov/iset)
  - Red-black tree
  - Query, min/max, remove
