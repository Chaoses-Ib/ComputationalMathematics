# Arbitrary-precision Arithmetic
[Wikipedia](https://en.wikipedia.org/wiki/Arbitrary-precision_arithmetic)

[The problem with float32: you only get 16 million values](https://pythonspeed.com/articles/float64-float32-precision/)

## Libraries
[List of arbitrary-precision arithmetic software - Wikipedia](https://en.wikipedia.org/wiki/List_of_arbitrary-precision_arithmetic_software)

### C++
- [GMP: The GNU MP Bignum Library](https://gmplib.org/)
  - mini-gmp
    - mini-mpq (v6.2)
    - [mini-gmpxx.h](https://github.com/vfonov/cork/blob/CloudCompare/contrib/gmp-6.1.2/mini-gmp/mini-gmpxx.h) (v6.1.2)

      [mini-gmpxx - mini-gmp C++ interface](https://gmplib.org/list-archives/gmp-devel/2019-July/005271.html)
  - vcpkg: [gmp](https://vcpkg.io/en/package/gmp) (failed to build?)

  [C++ Interface Rationals (GNU MP 6.3.0)](https://gmplib.org/manual/C_002b_002b-Interface-Rationals)
  - ```cpp
    mpq_class q (1.75);
    // Cannot:
    // mpq_class q ("1.75");
    q.get_str();
    ```
  - [GMP: how to write a number as a decimal value? - Stack Overflow](https://stackoverflow.com/questions/33740795/gmp-how-to-write-a-number-as-a-decimal-value)
  - [Parsing an exact decimal value using GMP - Musing Mortoray](https://mortoray.com/parsing-an-exact-decimal-value-using-gmp/)

  Libraries:
  - [MPFR: The GNU MPFR Library](https://www.mpfr.org/)
  - [mp++: Multiprecision for modern C++](https://github.com/bluescarni/mppp)
  - [MPIR: Multiple Precision Integers and Rationals](https://github.com/wbhart/mpir)

- [FLINT: Fast Library for Number Theory](https://flintlib.org/)

- [Boost.Multiprecision](https://github.com/boostorg/multiprecision)
  - [Floating-point Types](https://www.boost.org/doc/libs/1_85_0/libs/multiprecision/doc/html/boost_multiprecision/tut/floats.html)
  - [Rational Number Types](https://www.boost.org/doc/libs/1_85_0/libs/multiprecision/doc/html/boost_multiprecision/tut/rational.html)

  A lot of dependencies.

- [BigFloat: Arbitrary-Precision Floating Point Arithmetic Library](https://github.com/Mariotti94/BigFloat)

- [BigDecimal-CPP: A BigDecimal Implementation in C++ for arbitrary length integers and floating point numbers](https://github.com/Sam-bit/BigDecimal-CPP)

- [CppDecimal: Arbitrary Precision Decimal Library for C++17](https://github.com/semihc/CppDecimal)

[List of C++ multiple precision arithmetic libraries - Wikipedia](https://en.wikipedia.org/wiki/List_of_C%2B%2B_multiple_precision_arithmetic_libraries)

### Rust
- [gmp-mpfr-sys: Rust low-level bindings for GMP, MPFR and MPC](https://gitlab.com/tspiteri/gmp-mpfr-sys)
  - [rug: Arbitrary-precision numbers](https://gitlab.com/tspiteri/rug)

- [malachite: An arbitrary-precision arithmetic library for Rust.](https://github.com/mhogrefe/malachite)

- [dashu: A library set of arbitrary precision numbers implemented in Rust.](https://github.com/cmpute/dashu)
- [arpfloat: An arbitrary-precision floating-point library in Rust](https://github.com/nadavrot/arpfloat)
- [ApInt: Arbitrary precision integers library.](https://github.com/Robbepop/apint)

- [safe-decimal: Non-recurring Decimals](https://github.com/voliva/safe-decimal)

  [Solving the "floating point precision" problem with... floats? - DEV Community](https://dev.to/voliva/solving-the-floating-point-precision-problem-with-floats-4369)
