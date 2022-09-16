# Method of False Position
**Method of false position (regula falsi, 试值法)**

在 [Bisection Method](Bisection%20Method.md) 的基础上，修改 $x$ 为经过 $(a,f(a))$ 和 $(b,f(b))$ 的割线 $y-f(b)={f(b)-f(a) \over b-a}(x-b)$ 的横截距，即
$$x=b-{f(b)(b-a) \over f(b)-f(a)}$$

由于试值法中有根区间的长度可能不趋于零，试值法的终止判别条件需要修改为：
$$b-a<\delta \lor |f(c_n)|<\epsilon$$