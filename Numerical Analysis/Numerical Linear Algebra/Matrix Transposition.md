# Matrix Transposition
## Row-wise transposition
C:
```c
void trans(int N, int M, int A[N][M], int B[M][N])
{
    for (int i = 0; i < N; i++)
        for (int j = 0; j < M; j++)
            B[j][i] = A[i][j];
}
```

Python:
```python
def trans(A: np.ndarray):
    B = np.empty((A.shape[1], A.shape[0]))
    for i in range(A.shape[0]):
        for j in range(A.shape[1]):
            B[j][i] = A[i][j]
    return B
```

## Diagonal transposition
```c
void trans(int N, int A[N][N], int B[N][N])
{
    for (int k = 0; k <= 2 * (N - 1); k++) {
        for (int i = 0; i <= k; i++) {
            int j = k - i;
            if (i > N - 1 || j > N - 1)
                continue;
            B[j][i] = A[i][j];
        }
    }
}
```

Python:
```python
def trans(A: np.ndarray):
    assert A.shape[0] == A.shape[1]
    
    B = np.empty((A.shape[1], A.shape[0]))
    max_index = min(A.shape[0], A.shape[1]) - 1
    for k in range(2 * max_index + 1):
        for i in range(k + 1):
            j = k - i
            if i > max_index or j > max_index:
                continue
            B[j][i] = A[i][j]
    return B
```

## Block-wise transposition
### Block-8
```cpp
void trans(int N, int A[N][N], int B[N][N])
{
    int v0, v1;
    for (int block_j = 0; block_j < N; block_j += 8) {
        for (int block_i = 0; block_i < N; block_i += 8) {
            for (int i = block_i; i < block_i + 8; i++) {
                for (int j = block_j; j < block_j + 8; j++) {
                    B[j][i] = A[i][j];
                }
            }
        }
    }
}
```

### Block-8-diag
```cpp
void trans(int N, int A[N][N], int B[N][N])
{
    int v0, v1;
    for (int block_j = 0; block_j < N; block_j += 8) {
        for (int block_i = 0; block_i < N; block_i += 8) {
            for (int i = block_i; i < block_i + 8; i++) {
                for (int j = block_j; j < block_j + 8; j++) {
                    if (i != j) {
                        B[j][i] = A[i][j];
                    } else {
                        v0 = A[i][j];
                        v1 = i;
                    }
                }
                if (block_i == block_j) {
                    B[v1][v1] = v0;
                }
            }
        }
    }
}
```

### Block-8-8var
```cpp
void trans(int N, int A[N][N], int B[N][N])
{
    for (block_j = 0; block_j < N; block_j += 8) {
        for (block_i = 0; block_i < N; block_i += 8) {
            // Upper 4*8
            for (i = block_i; i < block_i + 4; i++) {
                // v[0:8] = A[i][0:8]
                v0 = A[i][block_j];
                v1 = A[i][block_j + 1];
                v2 = A[i][block_j + 2];
                v3 = A[i][block_j + 3];
                v4 = A[i][block_j + 4];
                v5 = A[i][block_j + 5];
                v6 = A[i][block_j + 6];
                v7 = A[i][block_j + 7];

                // B[0:4, i] = v[0:4]
                B[block_j][i] = v0;
                B[block_j + 1][i] = v1;
                B[block_j + 2][i] = v2;
                B[block_j + 3][i] = v3;

                // B[0:4, i + 4] = v[4:8]
                B[block_j][i + 4] = v4;
                B[block_j + 1][i + 4] = v5;
                B[block_j + 2][i + 4] = v6;
                B[block_j + 3][i + 4] = v7;
            }

            // Lower 4*8
            for (j = block_j; j < block_j + 4; j++) {
                // v[4:8] = A[4:8, j]
                v4 = A[block_i + 4][j];
                v5 = A[block_i + 5][j];
                v6 = A[block_i + 6][j];
                v7 = A[block_i + 7][j];

                // v[0:4] = B[j, 4:8]
                v0 = B[j][block_i + 4];
                v1 = B[j][block_i + 5];
                v2 = B[j][block_i + 6];
                v3 = B[j][block_i + 7];

                // B[j, 4:8] = v[4:8] = A[4:8, j]
                B[j][block_i + 4] = v4;
                B[j][block_i + 5] = v5;
                B[j][block_i + 6] = v6;
                B[j][block_i + 7] = v7;

                // B[j + 4, 0:4] = v[0:4]
                B[j + 4][block_i] = v0;
                B[j + 4][block_i + 1] = v1;
                B[j + 4][block_i + 2] = v2;
                B[j + 4][block_i + 3] = v3;

                // B[j + 4, 4:8] = A[4:8, j + 4]
                B[j + 4][block_i + 4] = A[block_i + 4][j + 4];
                B[j + 4][block_i + 5] = A[block_i + 5][j + 4];
                B[j + 4][block_i + 6] = A[block_i + 6][j + 4];
                B[j + 4][block_i + 7] = A[block_i + 7][j + 4];
            }
        }
    }
}
```

## Cache performance
Cache: 32 sets, 2 lines per set, 32 bytes per block.

For a $32\times 32$ matrix:

Algorithm | Hits | Misses | Evictions
--- | --- | --- | ---
Block-8-diag | 1766 | 287 | 255
Block-8-8var | 2250 | 315 | 283
Block-8 | 1710 | 343 | 311
Block-16-diag | 912 | 1141 | 1109
Row-wise transposition | 870 | 1183 | 1151
Diagonal transposition | 30 | 2023 | 1991

For a $64\times64$ matrix:

Algorithm | Hits | Misses | Evictions
--- | --- | --- | ---
Block-8-8var | 9074 | 1171 | 1139
Block-4-diag | 6450 | 1747 | 1715
Block-8-diag | 3562 | 4635 |4603
Block-16-diag | 3546 | 4651 | 4619

For a $61\times 67$ matrix:

Algorithm | Hits | Misses | Evictions
--- | --- | --- | ---
Block-16-diag | 6373 | 1809 | 1777
Block-8-diag | 6275 | 1907 | 1875

[CSAPP实验_cachelab - 知乎](https://zhuanlan.zhihu.com/p/441321071)