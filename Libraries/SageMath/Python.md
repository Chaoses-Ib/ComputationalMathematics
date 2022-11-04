# Python
[Why Python?](https://doc.sagemath.org/html/en/tutorial/afterword.html#why-python)

## [Standalone Python/Sage scripts](https://doc.sagemath.org/html/en/tutorial/programming.html#standalone-python-sage-scripts)
```python
from sage.all import *

# Sage predefines `x` to be a global indeterminate.
x = var('x')
```

## [Pre-parser](https://doc.sagemath.org/html/en/tutorial/afterword.html#the-pre-parser-differences-between-sage-and-python)
Sage pre-parses all command lines before passing them to Python:
- Wrapping integer literals in `Integer( )` and making division a constructor for rational numbers

  Sage implements arbitrary precision integers using the GMP C-library, which are significantly faster than Python's native integers.
- Replacing instances of `^` that are not in strings with `**`

  The bitwise xor operator in Sage is `^^`.
- [Callable symbolic expression](Symbolic/Expressions.md#callable-symbolic-expressions) variable assignment statement: `FUNCTION(*args) = Expression`