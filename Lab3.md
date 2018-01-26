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
