# [Functions](https://www.mathworks.com/help/matlab/functions.html)
Functions contain one or more sequential commands and can accept inputs and return outputs.

```matlab
function [output_arguments = ]function_name[(input_arguments)]
    ...
end
```

For example, this function named `fact()` computes the factorial of a number `n` and returns the result `f`.
```matlab
function f = fact(n)
    f = prod(1:n);
end
```
This type of function must be defined within a file, not at the command line. Often, you store a function in its own file. In that case, the best practice is to use the same name for the function and the file, since MATLAB associates the program with the file name. Save the file either in the current folder or in a folder on the MATLAB search path.