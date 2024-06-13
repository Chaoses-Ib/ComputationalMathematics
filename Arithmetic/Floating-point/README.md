# Floating-point Arithmetic
[Wikipedia](https://en.wikipedia.org/wiki/Floating-point_arithmetic)

## Base-2 (binary)
[关于二进制无法精确表示小数\_二进制能表示小数吗 - CSDN博客](https://blog.csdn.net/zidieq/article/details/125513241)

## Base-10 (decimal)
[Wikipedia](https://en.wikipedia.org/wiki/Decimal_floating_point)

C++:
- `std::decimal`

  [Base-10 floating point data types - C++ Forum](https://cplusplus.com/forum/beginner/89117/)

- [decimal\_for\_cpp: Decimal data type for C++](https://github.com/vpiotr/decimal_for_cpp)

  Values are stored internally using 64-bit integer, so maximum number of digits is 18.

- [→Boost.Multiprecision](../Arbitrary-precision/README.md#c)

- [Intel® Decimal Floating-Point Math Library](https://www.intel.com/content/www/us/en/developer/articles/tool/intel-decimal-floating-point-math-library.html)
  - vcpkg: [intelrdfpmathlib](https://vcpkg.io/en/package/intelrdfpmathlib)

## String conversion
- [Ryu: Converts floating point numbers to decimal strings](https://github.com/ulfjack/ryu)
- [Google/Double Conversion: Efficient binary-decimal and decimal-binary conversion routines for IEEE doubles.](https://github.com/google/double-conversion)