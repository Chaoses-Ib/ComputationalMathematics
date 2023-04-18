# Depth-first Search
[Wikipedia](https://en.wikipedia.org/wiki/Depth-first_search)

**Depth-ﬁrst search** always expands the deepest node in the frontier ﬁrst. It could be implemented as a call to BEST-FIRST-SEARCH where the evaluation function $f$ is the negative of the depth.

For ﬁnite state spaces that are trees it is efﬁcient and complete; for acyclic state spaces it may end up expanding the same state many times via different paths, but will (eventually) systematically explore the entire space.

In cyclic state spaces it can get stuck in an inﬁnite loop; therefore some implementations of depth-ﬁrst search check each new node for cycles. Finally, in inﬁnite state spaces, depthﬁrst search is not systematic: it can get stuck going down an inﬁnite path, even if there are no cycles. Thus, depth-ﬁrst search is incomplete.[^ai-modern]

A recursive implementation of DFS:

```py
procedure DFS(G, v) is
    label v as discovered
    for all directed edges from v to w that are in G.adjacentEdges(v) do
        if vertex w is not labeled as discovered then
            recursively call DFS(G, w)
```

A non-recursive implementation of DFS with worst-case space complexity $O(|E|)$, with the possibility of duplicate vertices on the stack:

```py
procedure DFS_iterative(G, v) is
    let S be a stack
    S.push(v)
    while S is not empty do
        v = S.pop()
        if v is not labeled as discovered then
            label v as discovered
            for all edges from v to w in G.adjacentEdges(v) do 
                S.push(w)
```

## Depth-limited search
To keep depth-ﬁrst search from wandering down an inﬁnite path, we can use depth-limited search, a version of depth-ﬁrst search in which we supply a depth limit, $ℓ$, and treat all nodes at depth $ℓ$ as if they had no successors.

Pesudocode[^ai-modern]:
```
function DEPTH-LIMITED-SEARCH(problem, ℓ) returns a node or failure or cutoff
  frontier ←a LIFO queue (stack) with NODE(problem.INITIAL) as an element
  result ←failure
  while not IS-EMPTY(frontier) do
    node←POP(frontier)
    if problem.IS-GOAL(node.STATE) then return node
    if DEPTH(node) > ℓ then
      result ←cutoff
    else if not IS-CYCLE(node) do
      for each child in EXPAND(problem, node) do
        add child to frontier
  return result
```

### Iterative deepening search
Pesudocode[^ai-modern]:
```
function ITERATIVE-DEEPENING-SEARCH(problem) returns a solution node or failure
  for depth = 0 to ∞ do
    result ←DEPTH-LIMITED-SEARCH(problem, depth)
    if result 6= cutoff then return result
```


[^ai-modern]: Russell, Stuart J. Artificial Intelligence a Modern Approach. Pearson Education, Inc.,