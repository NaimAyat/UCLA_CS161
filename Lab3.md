# Lab 3 (Jan 26, 2018)
## Search Algorithms
* Best-first search `f(n)`
* Greedy best-first search `f(n) = h(n)`
* A* `f(n) = g(n) + h(n)`
## Definitions
* Heuristic
  * Admissible (A* optimal)
  * Consistent
* Admissible heuristics
  * Never overestimates the distance to the goal
  * `h(v) = 0`
  * Straight-line distance (nodes are points on a plane)
* Consistent heuristics
  * `h(u) ≤ h(v) + e(u,v)`
  * `h(v) = 0`
  * Note: if a heurisitic is consistent, it is admissible. However, the inverse it not necessarily true.
## 8-Puzzle Problem
* h<sub>1</sub>(n) = number of tiles in the wrong position at state n
* h<sub>2</sub>(n) = sum of the Manhattan distance of each tile from its goal position
  * In other words: the sum of the minimum number of moves for each tile to get to its goal position
* h<sub>3</sub>(n) = sum of straight-line distance of each tile from its goal position
* h<sub>4</sub>(n) = sum of permutation inversions


#### Example
```
7 2 4
5   6
8 3 1
```
h<sub>1</sub>(n) = 6 (7, 4, 5, 8, 3, and 1 are in the wrong positions)

h<sub>2</sub>(n) = 2 + 0 + 3 + 1 + 1 + 3 + 4 = 14
