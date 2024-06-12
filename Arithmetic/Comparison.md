# Comparison
## Integer maximum or minimum
虽然对于实数有

$$\max(a,b) = {a+b+|a-b| \over 2}$$

但这并不能用于整数运算。

整数运算可以使用下面的算法：
```c
x - (((x-y) >> (WORDBITS-1)) & (x-y))
```