# Lecture 4 (Jan 22, 2018)
## Search Terminology 
* *Fringe* (also referred to as the *frontier*): Nodes waiting to be considered by algorithm
* *Expand*: For an existing node in the frontier; generate all of its children
## Tree Search
```
frontier = { initial state }
loop do
  if frontier is empty, return Fail
  node = choose to remove from frontier
  if node is goal state, return node's state
  frontier += node.expand()
```
