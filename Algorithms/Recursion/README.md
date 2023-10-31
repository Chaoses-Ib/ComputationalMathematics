# Recursion
[Wikipedia](https://en.wikipedia.org/wiki/Recursion_(computer_science))

**Recursion** is a method of solving a computational problem where the solution depends on solutions to smaller instances of the same problem. Recursion solves such recursive problems by using functions that call themselves from within their own code. The approach can be applied to many types of problems, and recursion is one of the central ideas of computer science.

Repeatedly calling a function from within itself may cause the call stack to have a size equal to the sum of the input sizes of all involved calls. It follows that, for problems that can be solved easily by iteration, recursion is generally less efficient, and, for large problems, it is fundamental to use optimization techniques such as tail call optimization.

## Divide and conquer
[Wikipedia](https://en.wikipedia.org/wiki/Divide-and-conquer_algorithm)

## Bellman equation
[Wikipedia](https://en.wikipedia.org/wiki/Bellman_equation)

[Bellman Equation (1): Understanding the Recursive Nature of the Bellman Equation in Mathematics | by Hossam Hamdy | Medium](https://medium.com/@hosamedwee/bellman-equation-1-understanding-the-recursive-nature-of-the-bellman-equation-in-mathematics-cd71bf14be1a)

> $$f(n)=\max{(r(n)+f(n+1))}$$
> 
> Where $f(n)$ represents the maximum total reward from stage $n$ to the final stage, $r(n)$ is the immediate reward at stage $n$, and $f(n+1)$ is the maximum total reward from stage $n+1$ to the final stage.

[Bellman Equation(2): The Convergence Property of the Bellman Equation | by Hossam Hamdy | Medium](https://medium.com/@hosamedwee/bellman-equation-2-the-convergence-property-of-the-bellman-equation-5eef03df7795)

[The Bellman Equation: simplify our value estimation - Hugging Face Deep RL Course](https://huggingface.co/learn/deep-rl-course/unit2/bellman-equation)

![](https://huggingface.co/datasets/huggingface-deep-rl-course/course-images/resolve/main/en/unit3/bellman4.jpg)