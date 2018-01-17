# Lecture 3 (Jan 17, 2018)
## Search
* Basic AI problem
* Long history, active topic
* Basis for games (ex. AlphaGo), SAT (boolean satisfiability problem), advanced reasoning
* More examples
  * Puzzles
    * 8-puzzle
    * Missionaries and cannibas
    * N-queens
    * Crypto arithmetic
    * Rubik's cube
  * Planning
    * Practical industry applications (ex. Amazon delivery)
* Structure
  * A *search engine* simply refers to a search algorithim
    * Inputs:
      1. Problem formulation
      2. Strategy
    * Outputs:
      1. Solution
### Search Problem Formulation
* Common elements
  * Initial state
  * Final/goal state or goal test/predicate
  * Actions
  * Transition model/successors
  * Costs
* Task: Find sequence of actions to move from initial to goal state
#### 8-Puzzle Example
```
1 2 3
6 5 7
9 8
```
* Actions: We can move the blank tile up, down, left, or right. In the current state, down and left are not permissible. 
### Observations
* States are atomic (no internal structure)
* States are discrete
* No percepts
* Deterministic transitions
* How man unique states? Typically factorial
* Choice of action space is important
  * 8-Puzzle example: Move tile `x` up/down/left/right is less efficient than move tile `blank` up/down/left/right
* Actions may not be applicable to all states
### Search Trees
* Ex. We have the initial state
  ```
    1
  3 2
  ```
  and the goal state
  ```
  1 2
  3
  ```
  [The resulting search tree (partial)](Images/searchTree.jpg)
* Before approaching a problem, you need to know:
  * Number of states
  * Solution depth
  * Branching factor 
* Observations
  * Some paths include the goal state
  * Solving the search problem is finding such path
  * Some paths are infinite (tree infinite)
  * Beware of repeated states
  * Different solutions vs. different qualitites
  * Search space vs. search tree
    * Search space: draw an arrow back to repeated state in tree to create a graph
  * 15-puzzle has 1.3 trillion states: few ms to solve
  * 24-puzzle has 10<sup>25</sup> states: one day to solve
  * Solving sliding block puzzles is NP-complete
