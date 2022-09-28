# Binary Search
**Binary search (half-interval searcch, logarithmic search, binary chop)** is a search algorithm that finds the position of a target value within a sorted array.[^wiki]

```python
def binary_search(A, T):
    L = 0
    R = len(A) - 1
    while L <= R:
        # or m = L + (R - L) // 2
        m = (L + R) // 2
        if A[m] < T:
            L = m + 1
        elif A[m] > T:
            R = m - 1
        else:
            return m
    return -1
```

Worst-case time complexity: $O(\log n)$

## Fewest comparison version
If the target value must be in the array:
```python
def binary_search(A, T):
    L = 0
    R = len(A) - 1
    while L < R:
        m = (L + R) // 2
        if A[m] < T:
            L = m + 1
        else:
            R = m
    return L
```
or simpler:
```python
def binary_search(A, T):
    result = 0
    for k in reversed(range(math.ceil(math.log2(len(A))))):
        i = result + 2**k
        if i < len(A) and T >= A[i]:
            result = i
    return result
```
The number of comparisons is exactly $\lceil log_2(n) \rceil$, which is approximately $72.5\%$ of the original version.

If the target value may not be in the array, you will have to check whether the result is correct at the end, the number of comparisons is therefore $\lceil log_2(n) \rceil + 1$.

[^wiki]: [Binary search algorithm - Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm)