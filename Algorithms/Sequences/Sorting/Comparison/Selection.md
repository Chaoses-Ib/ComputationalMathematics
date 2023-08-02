# Selection Sort
[Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)

不断选取最值，组成有序数组。

Out of place:
```python
def selection_sort(array):
    output = []

    while len(array) != 0:
	    # find and remove the min element
        min, min_i = array[0], 0
        for i in range(1, len(array)):
            if array[i] < min:
                min, min_i = array[i], i
        del array[min_i]
		
		# append the min element to the output
        output.append(min)
        
    return output
```

In place:
```python
def selection_sort(array):
    for j in range(len(array)):
	    # find the min element
        min, min_i = array[j], j
        for i in range(j + 1, len(array)):
            if array[i] < min:
                min, min_i = array[i], i
	    
	    # move the min element to the front
        array[min_i], array[j] = array[j], array[min_i]
        
    return array
```
Complexity[^wiki]:

$$T(n) = (n-1)+(n-2)+...+1 = (n-1)\frac{(n-1)+1}{2} = \frac{1}{2}(n^2-n) \in \Theta(n^2) $$


[^wiki]: [Selection sort - Wikipedia](https://en.wikipedia.org/wiki/Selection_sort)