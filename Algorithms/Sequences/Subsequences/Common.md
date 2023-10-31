# Longest Common Subsequences
[Wikipedia](https://en.wikipedia.org/wiki/Longest_common_subsequence)

> Let two sequences be defined as follows:  $X=(x_1 x_2 \cdots x_m)$ and $Y=(y_1 y_2 \cdots y_n)$.  The prefixes of $X$ are $X_0, X_1, X_2, \dots, X_m$; the prefixes of $Y$ are $Y_0, Y_1, Y_2, \dots, Y_n$.  Let $\mathit{LCS}(X_i,Y_j)$ represent the set of longest common subsequence of prefixes $X_i$ and $Y_j$. This set of sequences is given by the following.
> 
> $$
> \mathit{LCS}(X_i,Y_j)=\begin{cases}
>   \epsilon & \text{if }i=0\text{ or }j=0 \\
>   \mathit{LCS}(X_{i-1},Y_{j-1}) + x_i & \text{if }i,j>0\text{ and }x_i=y_j \\
>   \operatorname{\max}\{\mathit{LCS}(X_i,Y_{j-1}),\mathit{LCS}(X_{i-1},Y_j)\} & \text{if }i,j>0\text{ and }x_i\ne y_j.
> \end{cases}
> $$
> 
> To find the LCS of $X_i$ and $Y_j$, compare $x_i$ and $y_j$.  If they are equal, then the sequence $\mathit{LCS}(X_{i-1},Y_{j-1})$ is extended by that element, $x_i$.  If they are not equal, then the longest among the two sequences, $\mathit{LCS}(X_i,Y_{j-1})$, and $\mathit{LCS}(X_{i-1},Y_j)$, is retained.  (If they are the same length, but not identical, then both are retained.) The base case, when either $X_i$ or $Y_i$ is empty, is the empty string, $\epsilon$.

Python:
```python
def lcs(x, y):
    if len(x) == 0 or len(y) == 0:
        return ''
    elif x[-1] == y[-1]:
        return lcs(x[:-1], y[:-1]) + x[-1]
    else:
        return max(lcs(x[:-1], y), lcs(x, y[:-1]), key=len)
```

[Longest Common Subsequence - LeetCode](https://leetcode.com/problems/longest-common-subsequence/description/)

## Memoization
```python
def lcs(x, y):
    m, n = len(x) + 1, len(y) + 1
    c = np.empty((m, n), dtype=int)
    for i in range(m):
        c[i, 0] = 0
    for j in range(n):
        c[0, j] = 0
    for i in range(1, m):
        for j in range(1, n):
            if x[i-1] == y[j-1]:
                c[i, j] = c[i-1, j-1] + 1
            else:
                c[i, j] = max(c[i-1, j], c[i, j-1])
    
    def backtrack(i, j):
        if i == 0 or j == 0:
            return ''
        elif x[i-1] == y[j-1]:
            return backtrack(i-1, j-1) + x[i-1]
        elif c[i-1, j] > c[i, j-1]:
            return backtrack(i-1, j)
        else:
            return backtrack(i, j-1)
    return backtrack(m-1, n-1)
```

Time: $O(mn)$

Space: $O(mn)$

## Hunt–Szymanski algorithm
[Wikipedia](https://en.wikipedia.org/wiki/Hunt%E2%80%93Szymanski_algorithm)

Time: $O(mn\log m)$, but in practice $O(n\log n)$ is rather expected.

## Edit distances
The edit distance when only insertion and deletion is allowed (no substitution), or when the cost of the substitution is the double of the cost of an insertion or  deletion, is:

$$d'(X,Y) = n + m - 2 \cdot \left|LCS(X,Y)\right|.$$