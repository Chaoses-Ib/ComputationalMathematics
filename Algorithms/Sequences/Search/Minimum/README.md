# Minimum
## Range minimum query (RMQ)
[Wikipedia](https://en.wikipedia.org/wiki/Range_minimum_query)

"Range" is the range of the indices of the array.

Rust:
- [rmq-rs](https://github.com/mpetri/rmq-rs)

## Value range minimum query
Given an array of $N$ elements, a set of $K$ ranges, how to find the minimum in each range efficiently?

- Brute force: $O(NK)$
  - Multiple iterations

    Rust:
    ```rust
    a.iter().filter(|v| range.contains(v)).min()
    ```
  - Multiple comparisons

- Sort + binary search: $O(NlgN)$ + $O(KlgN)$

  Only faster than brute force when $\lg n < K$. Plus binary search is not cache-friendly.

- Divide + range minimum/maximum query

Rust: [min-rs](min-rs/src/lib.rs)
