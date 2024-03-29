# Bucket Sort
[Wikipedia](https://en.wikipedia.org/wiki/Bucket_sort)

Bucket sort assumes that the input is generated by a random process that distributes elements uniformly and independently over the interval $[0, 1]$.

Bucket sort divides the interval $[0,1)$ into $n$ equal-sized subintervals, or *buckets*, and then distributes the $n$ input numbers into the buckets. To produce the output, we simply sort the numbers in each bucket and then go through the buckets in order, listing the elements in each.

```python
def bucket_sort(A):
	n = len(A)
    B = []
    for _ in range(n):
        B.append([])
    
    for i in range(len(A)):
        B[int(A[i] * n)].append(A[i])
    for j in range(n):
        B[j] = sorted(B[j])  # insertion sort
    
    output = []
    for j in range(n):
        output.extend(B[j])
    return output
```

Time complexity: $\Theta(n)+\sum_{i=0}^{n-1}sort(n_i)$

When using insertion sort: $\Theta(n)$

Proof:
$$
\begin{align}
T(n)&=\Theta(n)+\sum_{i=0}^{n-1}O(n_i^2) \\
E(T(n))&=\Theta(n)+\sum_{i=0}^{n-1}O(&&E(n_i^2) \\
&&&=E(\sum_{j=1}^n X_{ij}^2) \\
&&&=
	\sum_{j=1}^n E(X_{ij}^2)
	+\sum_{1\le j\le n} \sum_{1\le k\le n,k\ne j} E(X_{ij}X_{ik}) \\
&&&=
	\sum_{j=1}^n(1^2\cdot\frac{1}{n}+0^2\cdot(1-\frac{1}{n}))
	+\sum_{1\le j\le n} \sum_{1\le k\le n,k\ne j} \frac{1}{n^2} \\
&&& = 2-\frac{1}{n} \\
&&&) \\
&=\Theta(n) &&
\end{align}
$$