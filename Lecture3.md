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
  * *Search engine*: any search algorithim
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
