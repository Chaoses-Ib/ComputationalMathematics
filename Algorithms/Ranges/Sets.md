# Range Sets
- Bitmaps
- [→Range maps](Maps.md)

Applications:
- ID pools

## Rust
[Benchmarks for (some) Range-Related Rust Crates (Sets only)](https://github.com/CarlKCarlK/range-set-blaze/blob/main/docs/bench.md)

[→Range maps](Maps.md#rust)

- [range-set: Store collections of PrimInt values as inclusive ranges using generic SmallVec-backed storage](https://github.com/spearman/range-set)
  - `SmallVec`
  - Query, min/max, remove, union
- [range-collections: Range collections for rust](https://github.com/rklaehn/range-collections)
  - `SmallVec`
  - Query, intersection, union, difference, symmetric difference, invert
- [Ranges: A generic replacement for the core/std range types.](https://gitlab.com/bit-refined/ranges/)
  - [`Ranges`](https://docs.rs/ranges/latest/ranges/struct.Ranges.html)
    - `Vec`
    - Query, intersection, union, difference, symmetric difference, `invert()`
- [rangetools: Traits extending the Rust Range structs in std::ops](https://github.com/rsnively/rangetools) ([Docs.rs](https://docs.rs/rangetools/))
  - `VecDeque`
- [every-range: Iterator that "fill in" missing ranges, i.e. the gap between two consecutive ranges](https://github.com/vallentin/every-range)
  - `trait EveryRange: Sized + Iterator<Item = Range<usize>>`

### ID pools
- [id-pool: Create and recycle integer ids using a ranged pool](https://github.com/adamsky/id-pool)
  ```rust
  pub struct IdPool {
      /// List of available id ranges
      free: Vec<Range>,
      /// Number of ids currently in use
      used: usize,
  }
  ```
  - Serialization: Serde

- [reusable-id-pool](https://github.com/davepollack/nushift/tree/master/reusable-id-pool)
  ```rust
  struct ReusableIdPoolInternal {
      frontier: u64,
      free_list: Vec<u64>,
  }
  ```

- [rangetree-rs: Range Tree, Rust API](https://github.com/ideasman42/rangetree-rs)
  - Red-black tree
