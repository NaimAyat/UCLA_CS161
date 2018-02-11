# *Artificial Intelligence: A Modern Approach* - Norvig & Russel (2010)
# Chapters 1, 2, 3, 5, 6, 7
## Chapter 1: Introduction
### 1.1 What is AI?
* Possible definition: machines that think and act rationally
#### 1.1.1 The Turing Test
* A computer passes the test if a human interrogator, after posing some written questions, cannot tell whether the written responses come from a person or from a computer.
  * To pass, a computer needs:
    * Natural language processing
    * Knowledge representation
    * Automated reasoning
    * Machine learning
* The "total" Turing Test includes a video signal so that the interrogator can test the subject's perceptual abilities, as well as the opportunity for the interrogator to pass physical objects "through the hatch". To pass this, the computer needs computer vision to perceive objects and robotics to manipulate objects and move.
## Chapter 2: Intelligent Agents
### 2.1 Agents and Environments
* An agent is anything that can be viewed as perceiving its environment through sensors and acting upon that environment through actuators.
#### 2.2 Rationality
* Rationality depends on four things: 
  1. The performance measure that defines the criterion of success.
  2. The agent’s prior knowledge of the environment.
  3. The actions that the agent can perform.
  4. The agent’s percept sequence to date.
* A **rational agent**: selects an action that is expected to maximize its performance measure for each possible percept sequence, given the evidence provided by the percept sequence and whatever built-in knowledge the agent has.
#### 2.3.1 Specifying the Task Environment
* PEAS: Performance, Environment, Actuators, Sensors
* For example, the PEAS desctiption for an automated taxi's task environment:
  * Performance measure: safe, fast, legal, comfortable trip, maximize profits
  * Environment: roads, traffic, pedestrians, customers
  * Actuators: steering, accelerator, brake, signal, horn, display
  * Sensors: cameras, sonar, speedometer, GPS, odometer, accelerometer, engine sensors, keyboard
#### 2.3.2 Properties of Task Environments
* If an agent's sensors give it acces to the complete state of the environment at each point in time, then the task environment is *fully observable*. Otherwise, it is *partially observable*. For example, an automated taxi cannot observe what other drivers are thinking.
* If the next state of the environment is completely determined by the current state and the action executed by the environment, then the environment is *deterministic*. Otherwise, it is *stochastic*.
## Chapter 3: Solving Problems by Searching
* Uninformed search algorithms: algorithms given no information about the problem other than its definition
* Informed search algorithms: given guidance on where to look for solutions
### 3.1 Problem-Solving Agents
* **Goal formulation**: finding the set of world states in which a goal is satisfied. This is the first step in problem solving.
* **Problem formulation**: process of deciding what actions and states to consider, given a goal. This is the second step in problem-solving.
* Observable environment: the agent always knows the current state
* Discrete environment: there are finitely actions to choose from (as opposed to infinte actions in a continous environment)
* Detministic: each action has exactly one outcome
#### 3.1.1 Well-Defined Problems and Solutions
* A **problem** is defined formally by five components:
  1. The **initial state** that the agent starts in. Ex. `In(LosAngeles)`.
  2. The set of possible **actions** available to the agent. Ex. `{Go(SanFrancisco), Go(Vegas), Go(SanDiego)}`
  3. A description of what each action does (the **transition model**), specified by a function `result(s,a)` that returns the state that results from doing action `a` in state `s`.  Ex. `Result(In(LosAngeles), Go(Vegas)) = In(Vegas)`
     * We also use the term *successor* to refer to any state reachable from a given state by a single action. 
     * Together, the inital state, actions, and transition model define the *state space* of the problem - the set of all states reachable from the initial state by any sequence of actions. 
     * The state space forms a directed *graph* in which the nodes are states and the links are actions.
     * A *path* in the state space is a sequence of states connected by a sequence of actions.
  4. The **goal test** determines whether a given state is a goal state.
  5. A **path cost** function that assigns a numeric cost to each path. The problem-solving agent chooses a cost function that reflects its own performance measure
     * The *step cost* of taking action `a` in a state `s` to reach state `s'` is denoted by `c(s,a,s')`.
* The preceding elements define a problem and can be gathered into a single data structute that is given as input to a problem-solving algorithm
* A *solution* to a problem is an action sequence that leads from the initial state to a goal state
* The *optimal solution* has the lowest path cost among all solutions
#### 3.1.2 Formulating Problems
* The process of removing detail from a representation is called *abstraction*
* The abstraction is valid if we can expand any abstract solution into a solution in the more detailed world; the abstraction is useful if carrying out each of the actions in the solution is easier than the original problem
### 3.2 Example Problems
* A *toy problem* is intended to illustrate various problem-solving methods
* A *real-world* problem is one whose solutions people will actually care about
* 8-queens problem: 8 queens are on an 8x8 chessboard. Find a positioning for each queen such that no two queens can attack each other.
  * States: Any arrangement of 0 to 8 queens on the board
  * Initial state: No queens on the board
  * Actions: Add a queen to any empty square (more intelligent action: add a queen to any square in the leftmost empty column such that it is not attacked by any other queen.
  * Transition model: Returns the board with a queen added to the specified square
  * Goal test: 8 queens are on the board, none are in the same row, column, or diagonal
### 3.3 Searching for Solutions
* Search tree: initial state is root; branches are actions; nodes are states in the state space of the problem
* To expand the current state, we apply each legal action to the current state, thereby generating a new set of states
* Leaf node: a node with no children in the tree
* The set of all leaf nodes available for expansion at any given time is called the **frontier**
* Need to keep track of each expanded node in the **explored set**
#### 3.3.1 Infrastructure for Search Algorithms
* For each node `n` of the tree, we have a structure that contains four components:
  1. State: the state in the state space to which the node corresponds
  2. Parent: the node in the search tree that generated this node
  3. Action: the action that was applied to the parent to generate this node
  4. Path-cost: the cost, denoted by `g(n)`, of the path from the initial state to this node, as indicated by the parent pointers
* Priority queue: pops the element of the queue with the highest priority according to some ordering function
#### 3.3.2 Measuring Problem-Solving Performance
* An algorithm's performance is evaluated in four ways:
  * **Completeness**: is the algorithm guaranteed to find a solution when there is one?
  * **Optimality**: Does the strategy find the optimal solution?
  * **Time complexity**: How long does it take to find a solution?
  * **Space complexity**: How much memory is needed to perform the search?
* Complexity is expressed in terms of three quantities:
  * `b`, the branching factor (maximum number of succesors of any node)
  * `d`, the depth of the shallowest goal node (number of steps along the path from the root)
  * `m`, the maximum length of any path in the state space
* To asses the effectiveness of a search algorithm, we can consider just the *search cost*, which typically depends on the time complexity but can also include a term for memory usage - or we can use the *total cost*, which combines the search cost and the path cost of the solution found
### 3.4 Uninformed Search Strategies
* Uninformed search strategies have no additional information about states beyond that provided in the problem definition. All they can do is generate successors and distinguish a goal state from a non-goal state.
#### 3.4.1 Breadth-First-Search
* [BFS](https://upload.wikimedia.org/wikipedia/commons/5/5d/Breadth-First-Search-Algorithm.gif) is a simple strategy in which the root node is expanded first, then all the successors of the root node are expanded next, then their successors, and so on. In general, all the nodes are expanded at a given depth in the search tree before any nodes at the next level are expanded.
  * Complete? Yes. If the shallowest goal node is at some finite depth `d`, BFS will eventually find it after generating all shallower nodes (provided the branching factor `b` is finite)
  * Optimal? No, unless the shallowest goal node is the optimal one
  * Time complexity? O(b<sup>d</sup>) (or O(b<sup>d+1</sup>) if the algorithm were to apply the goal test to nodes when selected for expansion rather than when generated)
### 3.5 Heuristic Search Strategies
* Strategies that know whether one non-goal state is "more promising" that another are called **informed search** or **heuristic search** strategies
