# Heapsort
[Wikipedia](https://en.wikipedia.org/wiki/Heapsort)

从输入数组构建 heap，然后边取出最值边维护 heap。
```python
def heap_sort(A):
    build_max_heap(A)
    # [A.last, root)
    for size in range(len(A) - 1, 0, -1):
        A[0], A[size] = A[size], A[0]
        max_heapify(A, 0, size)
```

Time complexity: $O(n\lg n)$