# [Matrices](https://www.mathworks.com/help/matlab/matrices-and-arrays.html)
A **matrix** is a two-dimensional, rectangular array of data elements arranged in rows and columns. The elements can be numbers, logical values (`true` or `false`), dates and times, strings, categorical values, or some other MATLAB data type. Matrix is the most basic MATLAB data structure. Even a single number is stored as a matrix.

## Construction
- Row vector
  ```matlab
  a = [1 2 3 4]
  % or a = [1,2,3,4]
  ```
- Matrix
  ```matlab
  a = [1 3 5; 2 4 6; 7 8 10]
  ```
  Result:
  ```matlab
  a = 3×3

      1     3     5
      2     4     6
      7     8    10
  ```
- [Number sequence](https://www.mathworks.com/help/matlab/ref/colon.html)
  ```matlab
  A = 1:10
  ```
  Result:
  ```matlab
  A = 1×10

     1     2     3     4     5     6     7     8     9    10
  ```
  With an increment value:
  ```matlab
  A = 1:0.2:2.1
  ```
  Result:
  ```matlab
  A = 1×6

    1.0000    1.2000    1.4000    1.6000    1.8000    2.0000
  ```

## [Indexing](https://www.mathworks.com/help/matlab/math/array-indexing.html)
```matlab
A = [1 2 3 4; 5 6 7 8; 9 10 11 12; 13 14 15 16]
%{
A = 4×4

     1     2     3     4
     5     6     7     8
     9    10    11    12
    13    14    15    16
%}
```
- Single element
  ```matlab
  e = A(3,2)
  ```
  Result:
  ```matlab
  e = 10
  ```
- Multiple elements
  ```matlab
  r = A(2,[1 3])
  ```
  Result:
  ```matlab
  r = 1×2

     5     7
  ```
- [Colon](https://www.mathworks.com/help/matlab/math/array-indexing.html)
  ```matlab
  r = A(1:3,2:end)
  ```
  Result:
  ```matlab
  r = 3×3

     2     3     4
     6     7     8
    10    11    12
  ```
  ```matlab
  r = A(:,3)
  ```
  Result:
  ```matlab
  r = 4×1

     3
     7
    11
    15
  ```
- Linear indexing
  ```matlab
  A = [12 36 91; 45 29 48; 33 25 11]
  Alinear = A(:)
  ```
  Result:
  ```matlab
  Alinear = 9×1

    12
    45
    33
    36
    29
    25
    91
    48
    11
  ```
  The [sub2ind(sz,row,col)](https://www.mathworks.com/help/matlab/ref/sub2ind.html) and [ind2sub(sz,ind)](https://www.mathworks.com/help/matlab/ref/ind2sub.html) functions help to convert between original array indices and their linear version.
- [Logical values](https://www.mathworks.com/help/matlab/matlab_prog/find-array-elements-that-meet-a-condition.html)
  ```matlab
  A = [1 2 6; 4 3 6]
  B = [0 3 7; 3 7 5]
  ind = A<B
  %{
  ind = 2x3 logical array

    0   1   1
    0   1   0
  %}
  Avals = A(ind)
  Bvals = B(ind)
  ```
  Result:
  ```
  Avals = 3×1

      2
      3
      6
  
  Bvals = 3×1

      3
      7
      7
  ```

## Concatenation
- Vertical concatenation
  ```matlab
  A = [a a]
  % or A = [a,a]
  ```
  Result:
  ```matlab
  A = 3×6

      1     3     5     1     3     5
      2     4     6     2     4     6
      7     8    10     7     8    10
  ```
- Horizontal concatenation
  ```matlab
  A = [a; a]
  ```
  Result:
  ```matlab
  A = 6×3

      1     3     5
      2     4     6
      7     8    10
      1     3     5
      2     4     6
      7     8    10
  ```

## Expansion
- ```matlab
  A = [10  20  30; 60  70  80]
  A(3,4) = 1
  ```
  Result:
  ```matlab
  A = 3×4

      10    20    30     0
      60    70    80     0
      0     0     0     1
  ```
- ```matlab
  A(4:5,5:6) = [2 3; 4 5]
  ```
  Result:
  ```matlab
  A = 5×6

    10    20    30     0     0     0
    60    70    80     0     0     0
     0     0     0     1     0     0
     0     0     0     0     2     3
     0     0     0     0     4     5
  ```

## Operations
- ```matlab
  a + 10
  ```
  Result:
  ```matlab
  ans = 3×3

      11    13    15
      12    14    16
      17    18    20
  ```
- ```matlab
  sin(a)
  ```
  Result:
  ```matlab
  ans = 3×3

    0.8415    0.1411   -0.9589
    0.9093   -0.7568   -0.2794
    0.6570    0.9894   -0.5440
  ```

## Empty arrays
An empty array in MATLAB is an array with at least one dimension length equal to zero. Empty arrays are useful for representing the concept of "nothing" programmatically. You can check for empty arrays using [isempty()](https://www.mathworks.com/help/matlab/ref/tscollection.isempty.html).