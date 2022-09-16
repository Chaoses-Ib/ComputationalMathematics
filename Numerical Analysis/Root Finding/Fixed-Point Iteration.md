# Fixed-Point Iteration
See [Fixed Points](https://github.com/Chaoses-Ib/Mathematics/blob/main/Analysis/Functions/Fixed%20Points.md).

$$x_{k+1}=g(x_k)$$

算法：
1. 给定满足 $f(a)\cdot f(b)<0$ 的有根区间 $[a,b]$ 和精度要求 $\epsilon$
2. 确定 $f(x)=0$ 的等价形式 $x=\phi(x)$ 及初值 $x_0$
3. `do` $x_{k+1}=\phi(x_k)$
   1. `while not` $|x_{k+1}-x_k|<\epsilon$

几何解释：  
![](images/Fixed-point-iteration.png)

## Order of convergence
线性收敛