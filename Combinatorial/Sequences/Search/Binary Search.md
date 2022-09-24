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

[^wiki]: [Binary search algorithm - Wikipedia](https://en.wikipedia.org/wiki/Binary_search_algorithm)