# Merge Algorithms
[Wikipedia](https://en.wikipedia.org/wiki/Merge_algorithm)

**Merge algorithms** are a family of algorithms that take multiple sorted lists as input and produce a single list as output, containing all the elements of the inputs lists in sorted order. These algorithms are used as subroutines in various sorting algorithms, most famously merge sort.

- Two-way merging
- K-way merging

## Two-way merge algorithms
### Implementations
Rust:
- [rayon::slice::mergesort](https://github.com/rayon-rs/rayon/blob/63b959cef554d46c7bb6b4ab3d643edf7b99f1ea/src/slice/mergesort.rs)

  Parallel.

## K-way merge algorithms
[Wikipedia](https://en.wikipedia.org/wiki/K-way_merge_algorithm)

Time: $O(n\log k)$

### Implementations
Rust:
- [itertools::kmerge](https://docs.rs/itertools/latest/itertools/trait.Itertools.html#method.kmerge)

## Merge-then-sort vs sort-then-merge
The time complexity of sorting is $O(n\log n)$. If we divide $n$ into $n_1$ and $n_2$, then

$$\begin{align}
n\log n &=(n_1+n_2)\log {(n_1+n_2)} \\
% &=n_1\log {(n_1+n_2)} + n_2\log {(n_1+n_2)} \\
&\stackrel{?}{=} n_1 \log n_1 + n_2 \log n_2 + (n_1+n_2)\log 2
\end{align}$$

Remove the $log$:

$$\begin{align}
% & n_1 \log n_1 + n_2 \log n_2 + (n_1+n_2)\log 2
% - (n_1\log {(n_1+n_2)} + n_2\log {(n_1+n_2)}) \\
% &= n_1 \log{n_1 \over n_1+n_2} + n_2 \log{n_2 \over n_1+n_2} + (n_1+n_2) \log 2 \\

(n_1+n_2)^{n_1+n_2} \stackrel{?}{=} {n_1}^{n_1} {n_2}^{n_2} 2^{n_1+n_2}
\end{align}$$

By using binomial theorem, we can get

$$\begin{align}
(n_1+n_2)^{n_1+n_2} &= \sum_{k=0}^n {n_1+n_2 \choose k} {n_1}^{n_1+n_2-k} {n_2}^k \\
{n_1}^{n_1} {n_2}^{n_2} 2^{n_1+n_2} &= \sum_{k=0}^n {n_1+n_2 \choose k} {n_1}^{n_1} {n_2}^{n_2}
\end{align}$$

If $n$ is divided equally, i.e. $n_1=n_2$, then

$$\begin{align}
{n_1}^{n_1+n_2-k} {n_2}^k - {{n_1}^{n_1} {n_2}^{n_2}} = 0
\end{align}$$

This means that "sorting subarrays and then merging them" can be as fast as "sorting the entire array" in terms of time complexity.

[java - Is it faster to merge and then sort, or sort and then merge? - Stack Overflow](https://stackoverflow.com/questions/15924572/is-it-faster-to-merge-and-then-sort-or-sort-and-then-merge)