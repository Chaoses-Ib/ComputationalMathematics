# Quicksort
[Wikipedia](https://en.wikipedia.org/wiki/Quicksort)

## Description
![](https://upload.wikimedia.org/wikipedia/commons/6/6a/Sorting_quicksort_anim.gif) [^wiki]

### Divide
Partition the array $A[p..r]$ into two subarrays $A[p..q-1]$ and $A[q+1..r]$ such that each element of $A[p..q-1]$ is less than or equal to $A[q]$, which is, in turn, less than or equal to each element of $A[q+1..r]$. Compute the index $q$ as part of this partitioning procedure.

```python
def partition(A, p, r):
	# select A[r] as the value of A[q] (pivot)
    x = A[r]
    i = p - 1
    for j in range(p, r):
	    # 只要把小于等于 x 的元素挪到前面来，大于 x 的就自然排在了后面
        if A[j] <= x:
            i = i + 1
            A[i], A[j] = A[j], A[i]
            # A: <=x, <=x, ...
    # A: <=x, <=x, ..., >x, >x, x
    A[i + 1], A[r] = A[r], A[i + 1]
    # A: <=x, <=x, x, >x, >x, ...
    return i + 1
```
合并对 $A[q]$ 的处理可以让代码更简洁：
```python
def partition(A, p, r):
    x = A[r]
    i = p - 1
    for j in range(p, r + 1):
        if A[j] <= x:
            i = i + 1
            A[i], A[j] = A[j], A[i]
    return i
```
如果要按指定 pivot 划分，可以直接修改 x：
```python
def partition_pivot(A, p, q, r):
    x = A[q]
    i = p - 1
    for j in range(p, r + 1):
        if A[j] <= x:
            i = i + 1
            A[i], A[j] = A[j], A[i]
    return i
```
这里的 partition 实际上是个按 x 划分数组的通用算法，x 可以不在数组中。

此外也可以通过交换 pivot 到末尾来实现：
```python
def partition_pivot(A, p, q, r):
	A[q], A[r] = A[r], A[q]
	return partition(A, p, r)
```

### Conquer
Sort the two subarrays $A[p..q-1]$ and $A[q+1..r]$ by recursive calls to quicksort.

```python
def quicksort(A, p, r):
	# 因为我们在递归调用 quicksort 时的 q-1 和 q+1 没有进行越界检测，这里必须要判断一下
	# 比如当 p=0, r=1 时，q=0 会造成 quicksort(0,-1)；q=1 会造成 quicksort(2,1)
    if p < r:  # p <= r 也是正确的
        q = partition(A, p, r)
        quicksort(A, p, q - 1)
        quicksort(A, q + 1, r)
```

### Combine
Because the subarrays are already sorted, no work is needed to combine them.

## Introsort
[Wikipedia](https://en.wikipedia.org/wiki/Introsort)

**Introsort (introspective sort)** is a hybrid sorting algorithm that provides both fast average performance and (asymptotically) optimal worst-case performance. It begins with quicksort, it switches to heapsort when the recursion depth exceeds a level based on (the logarithm of) the number of elements being sorted and it switches to insertion sort when the number of elements is below some threshold.

### Pattern-defeating quicksort
[GitHub](https://github.com/orlp/pdqsort)

**Pattern-defeating quicksort (pdqsort)** is a variant of introsort incorporating the following improvements:
- Median-of-three pivoting,
- "BlockQuicksort" partitioning technique to mitigate branch misprediction penalities,
- Linear time performance for certain input patterns (adaptive sort),
- Use element shuffling on bad cases before trying the slower heapsort.

pdqsort is used by Rust, GAP, and the C++ library Boost.

[Pattern-defeating quicksort | Hacker News](https://news.ycombinator.com/item?id=14661659)


[^wiki]: [Quicksort - Wikipedia](https://en.wikipedia.org/wiki/Quicksort)