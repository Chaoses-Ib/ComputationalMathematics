# Selection Algorithms
[Wikipedia](https://en.wikipedia.org/wiki/Selection_algorithm)

## Smallest values selection
- Tournament

  Comparisons: $n - k + (k-1) \log (n-k+2)$ ($\approx n+k\log n$)

  [Finding Kth Minimum (partial ordering) – Using Tournament Algorithm (Malkit's Blog)](https://web.archive.org/web/20151002100306/https://blogs.oracle.com/malkit/entry/finding_kth_minimum_partial_ordering)
- Heap

  Comparisons: $O(n\log k)$

  [Finding the top K items in a list efficiently](http://stevehanov.ca/blog/?id=122)

[sorting - Optimal algorithm for returning top k values from an array of length N - Stack Overflow](https://stackoverflow.com/questions/4956593/optimal-algorithm-for-returning-top-k-values-from-an-array-of-length-n)

[topk selection · Issue #1870 · arrayfire/arrayfire](https://github.com/arrayfire/arrayfire/issues/1870)

## Most frequent values selection
- [TopK: TopK algorithm implementation in Rust (Filtered Space-Saving)](https://github.com/NewbieOrange/topk)