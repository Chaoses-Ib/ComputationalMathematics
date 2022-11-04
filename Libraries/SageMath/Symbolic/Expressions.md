# Symbolic Expressions
## [Symbolic variables](http://match.stanford.edu/reference/calculus/sage/calculus/var.html)
- `var(*args)`
  ```python
  var('x y')
  var('x', 'y')
  var(['x', 'y'])
  var('x'), var('y')
  ```
  The new variable is both returned and automatically injected into the global namespace. If you need a symbolic variable in library code, you must use either `SR.var()` or `SR.symbol()`.

  Sage predefines `x` to be a global indeterminate.

## [Symbolic expressions](http://match.stanford.edu/reference/calculus/sage/symbolic/expression.html)

## [Callable symbolic expressions](http://match.stanford.edu/reference/calculus/sage/symbolic/callable.html)
A callable symbolic expression is a symbolic expression with specified arguments.

Create a callable symbolic expression:
- `Expression.function(*args)` [](#symbolic-expressions)

  e.g.
  ```python
  f = (x + 1).function(x)
  ```
- IPython: `FUNCTION(*args) = Expression`
  
  e.g.
  ```python
  f(x) = x + 1
  ```

Difference between symbolic expressions and callable ones:
```python
x + 1                      # x + 1
(x + 1)(x=1)               # 2

(x + 1).function(x)        # x |--> x + 1
(x + 1).function(x)(x=x)   # x + 1
(x + 1).function(x)(x=1)   # 2
(x + 1).function(x)(x)     # x + 1
(x + 1).function(x)(1)     # 2
```