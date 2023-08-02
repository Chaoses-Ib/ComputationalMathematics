# Radix Sort
[Wikipedia](https://en.wikipedia.org/wiki/Radix_sort)

依次使用元素的每一位进行排序。

最自然的想法是从最高位往最低位排，但这样会产生很多分组，对下一位的排序只能在各个分组中独立进行，比较麻烦。

更好的方法是从最低位往最高位排，实现更加简单。

```python
# array contains n d-digit numbers in which each digit can take up to k possible values
def radix_sort(array, d, k):
    for i in reversed(range(d)):
        array = counting_sort(array, k, lambda x: x[i])
    return array
```

## Complexity Analysis
Time complexity: $\Theta(d\cdot sort(n, k))$
- When using counting sort: $\Theta(d(n+k))\approx \Theta(n)$

虽然 radix sort 的 time complexity 低于 comparison sorts 的 $O(n\log n)$，但实际中只有在数据量至少达到百万级别时 radix sort 才能表现出优势。

## How to break each key into digits
Given $n$ $b$-bit numbers and any positive integer $r\le b$, radix sort correctly sorts these numbers in $\Theta(\frac{b}{r}(n + 2^r))$ time if the stable sort it uses takes $\Theta(n+k)$ time for inputs in the range $0$ to $k$.

Proof:
$$\begin{align}
d&=\lceil{\frac{b}{r}}\rceil \\
k&=2^r \\
\Theta(d(n+k))&=\Theta(\frac{b}{r}(n+2^r))
\end{align}
$$

When $r=\lfloor \lg{n} \rfloor$, $\frac{b}{r}(n+2^r)$ is asymptotically optimal.
- If $b<\lfloor \lg{n}\rfloor$, then choose $r=b$.
- If $b\ge \lfloor \lg{n}\rfloor$, then choose $r=\lfloor \lg{n} \rfloor$.

## Implementations
Rust:
- [Voracious sort: Voracious radix sort](https://github.com/lakwet/voracious_sort)
- [rdx](https://docs.rs/rdx/latest/rdx/)
- [rdxsort-rs](https://github.com/crepererum/rdxsort-rs)