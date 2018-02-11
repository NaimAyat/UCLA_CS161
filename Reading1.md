# *Artificial Intelligence: A Modern Approach* - Norvig & Russel (2010)
# Chapters 1, 2, 3, 5, 6
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
* Uses a FIFO queue
* Complete? Yes. If the shallowest goal node is at some finite depth `d`, BFS will eventually find it after generating all shallower nodes (provided the branching factor `b` is finite)
* Optimal? No, unless the shallowest goal node is the optimal one
* Time complexity? O(b<sup>d</sup>) (or O(b<sup>d+1</sup>) if the algorithm were to apply the goal test to nodes when selected for expansion rather than when generated)
* Space complexity? b<sup>d</sup> (or b<sup>d+1</sup> if the algorithm were to apply the goal test to nodes when selected for expansion rather than when generated)
* Takeaway: the memory requirements are a bigger problem for BFS than the execution time. However, time is still a major factor. In general, exponential-complexity search problems cannot be solved by uninformed methods for any but the smallest instances
#### 3.4.2 Uniform-Cost Search
* When all step costs are equal, BFS search is optimal because it always expands the shallowest unexpanded node. Instead of expanding the shallowest node, uniform-cost search expands the node `n` with the lowest path cost `g(n)`. This is done by storing the fronteir as a priority queue ordered by `g`. 
* The goal test is applied to a node when it is selected for expansion rather than when it is first generated.
* A test is added in case a better path is found to a node currently on the frontier.
* Time complexity: let C* be the cost of the optimal solution, and assume that every action costs at least e. Then the time and space complexity is O(b<sup>1+[C*/e]</sup>), which can be much greater than b<sup>d</sup>. When all step costs are equal, b<sup>1+[C*/e]</sup> is just b<sup>d+1</sup>.
#### 3.4.3 Depth-First Search
* [DFS](https://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif) always expands the deepest node in the current frontier of the search tree
* Uses a LIFO queue
* Complete? No, it could fall into an infinite loop
* Optimal? No
* Time complexity: O(b<sup>m</sup>)
* Space complexity: bm
* Takeaways: no clear advantages over BFS apart from much lower space complexity
#### 3.4.4 Depth-Limited Search
* Solves the problem of DFS getting caught in an infinite loop by defining a depth limit `l`. Nodes at depth `l` are treated as if they have no successors.
* Complete? No, if we choose `l` < `d` (shallowest goal is beyond depth limit)
* Optimal? No, if we choose `l` > `d`
* Time complexity? O(b<sup>l</sup>)
* Space complexity? bl
#### 3.4.5 Iterative Deepening Depth-First Search
* Gradually increases the depth limit until a goal is found.
* Complete? Yes, when `b` is finite (like BFS)
* Optimal? Yes, when the path cost is a nondecreasing function of the depth of the node (like BFS)
* Time complexity? O(b<sup>d</sup>) (like BFS)
* Space complexity? bd (better than BFS)
#### 3.4.6 Biderectional Search
* Run two simultaneous searches - one forward from the initial state and the other backward from the goal - hoping that the two meet in the middle.
* Complete? Yes, if `b` is finite and both directions use BFS
* Optimal? Yes, if step costs are all identical and both directions use BFS
* Time complexity?  O(b<sup>d/2</sup>)
* Space complexity? (b<sup>d/2</sup>)
#### 3.4.7 Comparing Uninformed Search Strategies
* [Comparison table for uninformed search strategies](Images/uninformedComparison.PNG)
### 3.5 Informed (Heuristic) Search Strategies
* Strategies that know whether one non-goal state is "more promising" that another are called **informed search** or **heuristic search** strategies
* A node is selected for expansion based on an evaluation function, `f(n)`. The evaluation function is construed as a cost estimate, so the node with the lowest evaluation is expanded first. The implementation is identical to that for uniform-cost search, except for the use of `f` istead of `g` to order the priority queue
* The choice of `f` determines the search strategy. Most best-first algorithms include a **heuristic function** `h(n)` as a component of `f`.
* `h(n) = estimated cost of the cheapest path from the state at node n to a goal state`
#### 3.5.1 Greedy Best-First Search
* Tries to expand the node closest to the goal on the grounds that this is likely to lead to a solution quickly. Thus, it evaluates nodes by using just the heuristic function: that is, `f(n) = h(n)`
* We can use the **straight-line distance** heuristic, denoted h<sub>SLD</sub>. 
* Complete? No, could get stuck in an infinite loop
* Optimal? No, greedy algorithm is not always optimal
* Time complexity? O(b<sup>m</sup>)
* Space complexity? (b<sup>m</sup>)
#### 3.5.2 A* Search: Minimizing the Total Estimated Solution Cost
* Evaluate nodes by combining `g(n)`, the cost to reach the node, and `h(n)`, the cost to get from the node to the goal: `f(n) = g(n) + h(n)`
* Since `g(n)` gives the path cost from the start node to node `n` and `h(n)` is the estimated cost of the cheapest path from `n` to the goal, we have `f(n) = estimated cost of the cheapest solution through n`
* Algorithm identical to Uniform-Cost Search, but A* uses `g + h` instead of `g`
##### Conditions for Optimality: Admissibility and Consistency
* `h(n)` must be an **admissible heuristic** for tree-search optimality. This means that it never overestimates the cost to reach the goal. Because `g(n)` is the actual cost to reach `n` along the current path, and `f(n) = g(n) + h(n)`, we know that `f(n)` never overestimates the true cost of a solution along the current path through `n`.
* **Consistency** is required for applications of A* to graph search. A heuristic `h(n)` is consistent if for every node `n` and every succesor `n'` of `n` generated by any action `a`, the estimated cost of reaching the goal from `n` is no greated than the step cost of getting to `n'` plus the estimated cost of reaching the goal from `n'`: `h(n) ≤ c(n', a, n') + h(n')`
  * This is a form of the *triangle inequality*, which stipulates that each side of a triangle cannot be longer than the sum of the other two sides
##### Optimality of A*
* The tree-search version of A* is optimal if `h(n)` is admissible; the graph-search version of A* is optimal if `h(n)` is consistent
* If C* is the cost of the optimal path:
  * A* expands all nodes with `f(n) < C*`
  * A* might then expand some of the nodes right on the goal contour (where `f(n) = C*`)
* A* is optimally efficient for any given no consistent heuristic
* A* is complete, optimal, and optimally efficient
  * However, for problems with constant step costs, the growth of run time as a function of the optimal solution depth `d` is analyzed in terms of the *absolute error* or *relative error* of the heuristic. 
    * Absolute error: Δ ≡ h* - h, where h* is the actual cost of getting from the root to the goal
    * Relative error: ε ≡ (h* - h) / h*
* For a state space with a single goal, time complexity of A* is exponential in terms of the absolute error:
  * O(b<sup>Δ</sup>)
* For constant step costs, time complexity of A* is:
  * O(b<sup>εd</sup>)
* Branching factor: b<sup>ε</sup>
#### 3.5.3 Memory-Bounded Heuristic Search
* To reduce memory requirements for A*, we can use **iterative-deepening A* (IDA*)**
  * Cutoff is the f-cost `g+h` rather than depth. At each iteration, the cutoff value is the smallest f-cost of any node that exceeded the cutoff on the previous iteration
* **Recursive Best-First Search (RBFS)** attempts to mimic the operation of standard best-first search, but using only linear space.
  * RBFS replaces the f-value of each node along the path with a *backed-up* value, the best f-value of its children
  * Optimal if heuristic `h(n)` is admissible
* IDA* and RBFS use too little memory
  * IDA* retains only a single number between iterations (current f-cost limit)
  * RBFS retains more information, but only uses linear space
  * Because these algorithms forget most of what they have done, they expand the same states many times over
* **Memory-Bounded A* (MA*)** and **Simplified MA* (SMA*)** use all available memory
  * SMA* proceeds like A*, expanding the best leaf until memory is full. It always drops the worst leaf node - the one with the highest f-value. 
    * Complete if there is any reachable solution (if `d` is less than the memory size)
    * Optimal if any optimal solution is reachable
#### 3.5.4 Learning to Search Better
* An agent can learn to search better using **metalevel state space**
  * Each state in a metalevel state space captures the internal state of a program that is searching in an *object-level state space*
### 3.6 Heuristic Functions
* Possible heuristics for 8-puzzle
  1. The number of misplaced tiles. This is admissible since every misplaced tiles must be moved at least once
  2. The sum of the distances of the tiles from their goal positions. This sum of horizontal and vertical distance is called the **Manhattan Distance**. This is admissible because all any move can do is move one tile one step closer to the goal
#### 3.6.1 The Effect of Heuristic Accuracy on Performance
* We can characterize the quality of a heuristic with the **effective branching factor `b*`**. If the total number of nodes generated by A* for a particular problem is `N` and the solution depth is `d`, then `b*` is the branching factor that a uniform tree of depth `d` would have to have in order to contain `N+1` nodes. 
  * `N + 1 = 1 + b* + (b*)^2 + ... + (b*)^d`
#### 3.6.2 Generating Admissible Heuristics from Relaxed Problems
* A problem with fewer restrictions on the actions is called a relaxed problem
  * The cost of an optimal solution to a relaxed problem is an admissible heuristic for the original problem
    * Therefore, it obeys the triangle inequality and is consistent
#### 3.6.3 Generating Admissible Heuristics from Subproblems: Pattern Databases
* Admissible heuristics can also be derived from the solution cost of a subproblem
* The idea behind pattern databases is to store the exact solution costs for every possible 
#### 3.6.4 Learning Heuristics from Experience
* A heuristic function `h(n)` is supposed to estimate the cost of a solution beginning from the state at node `n`
## Chapter 5: Adversarial Search
* Adverserial search problem: competive environments (ie. games)
* Game theory: any multiangent environment is a "game"
* In arificial intelligence, the most common type of game are turn-taking, two-player, **zero-sum games** of **perfect information**
  * In other words, these games have deterministic, fully observable environments in which two agents act alternately and in which the utility alues at the end of the game are always equal and opposite. For example, if one player wins in chess, the other player necessarily loses
* We begin with a definition of the optimal move and an algorithm for finding it
  * *Pruning* allows us to ignore portions of the search tree that have no difference to the final choice
  * Heuristic *evaluation functions* allow us to approximate the true utility of a state without doing a complete search
* We consider games with two players, whome we call `max` and `min`
  * `max` moves first, and they take turns moving until the game is over
  * At the end of the game, points are awarded to the winning player and penalties are given to the loser
* A game can be formally defined as a search problem with the following elements:
  * S<sub>0</sub>: The initial state, which specifies how the game is set up at the start
  * `Player(s)`: Defines which player has the move in a state
  * `Actions(s)`: Returns the legal set of moves in a state
  * `Result(s,a)`: The transition model, which defines the result of a move
  * `TerminalTest(s)`: A terminal test, which is true when the game is over and false otherwise. States where the game has ended are called terminal states
  * `Utility(s,p)`: A utility function defines the final numeric value for a game that ends in a terminal state `s` for player `p`. In chess, the outcome is a win (+1), loss (0), or draw (1/2). A zero-sum game is defined as one where the total payoff to all players is the same for every instance of the game. For example, the total payoff of a chess match is 1.
### 5.2 Optimal Decisions in Games
* Given a game tree, the optimal strategy can be tetermined from the **minimax value** of each node, denoted as `Minimax(n)`. The minimax value of a node is the utility (for `max`) of being in the corresponding state, assuming that both players play optimally from there to the end of the game.
#### 5.2.1 The Minimax Algorithm
* Time complexity of minimax: O(b<sup>m</sup>)
* Space complexity of minimax: bm if all actions generated at once; m if actions generated one at a time
#### 5.2.2 Optimal Decisions in Multiplayer Games
* Need to represent each node as a vector <A, B, C, ...>. A represents player A's utility from a node, B represents plaer B's utility from a node, etc.
### 5.3 Alpha-Beta Pruning
* The problem with minimax search is that the number of game states it has to examine is exponential in the depth of the tree
* We can't eliminate the exponent, but we can cut it in half with pruning
* **Alpha-Beta** pruning: ignore (don't expand) nodes that have no chance of occuring in a true minimax scenario wherein each player plays optimally
  * α: value of the best (highest-value) choice we have found at any choice point along the path for `max`
  * β: value of the best (lowest-value) choice we have found at any choice point along the path for `min`
  * Alpha-Beta seach updates the values for alpha and beta as it goes along and prunes the remaining branches at a node (ie. terminates the recursive call) as soon as the node is known to be worse than the current alpha or beta value.
  * [Example search tree](Images/ab.PNG)
#### 5.3.1 Move Ordering
* Alpha-Beta time complexity: O(b<sup>m/2</sup>)
### 5.4 Imperfect Real-Time Decisions
* Minimax generates the entire game search space, whereas alpha-beta algorithm prunes large parts of it
* The depth of minimax and A-B is usually not practical, so we can cut off the search earlier and apply a heuristic *evaluation function* to states in the search, effectively turning nonterminal nodes into terminal leaves
  * Alter minimax or alpha-beta in two ways: replace the utility function by a heuristic evaluation function `Eval`, which estimates a position's utility, and replace the terminal test by a *cutoff test* that decides when to apply `Eval`
#### 5.4.1 Evaluation Functions
* Returns an estimate of the expected utility of the game from a given position, just as heuristic functions from Chapter 3 return an estimate of distance to the goal
* A reasonable evaluation for states is *expected value*
#### 5.4.2 Cutting Off Search
* We want to modify alpha-beta search so it will call the heuristic `Eval` funcion when it is appropriate to cut off the search
* A problem is the *horizon effect*, which arises when the program is facing an opponent's m ove that causes serious damage and is ultimately unavoidable, but can be temporarily avoided by delaying tactics
### 5.5 Stochastic Games
* Stochastic games combine luck and skill (ie. dice are rolled)
* Minimax trees must include chance nodes in addition to minimax nodes; positions will no longer have definite minimax values, but expected values
#### 5.5.1 Evaluation Functions for Games of Chance
* Use **Monte Carlo Simulation** to evaluate a position
  * Start with alpha-beta algorithm. Have the algorithm play thousands of games against itself, using random dice rolls
## Chapter 6: Constraint Satisfaction Problems
* Constraint satisfaction problems use a *factored representation* for each state: a set of variables, each of which has a value
  * A problem is solved when each variable has a value that satisfies all the constraints on the variable
### 6.1 Defining Constraint Satisfaction Problems
* Three components, X, D, and C:
  * X is a set of variables {X<sub>1</sub>, ..., X<sub>n</sub>}
  * D is a set of domains {D<sub>1</sub>, ..., D<sub>n</sub>}, one for each variable
  * C is a set of constraints that specify allowable combinations of values
  * Each domain D<sub>i</sub> consists of a set of allowable values {v<sub>1</sub>, ..., v<sub>2</sub>} for variable X<sub>i</sub>
  * Each constraint C<sub>i</sub> consists of a pair <scope, rel> where scope is a tuple of variables that participate in the constraint and rel is a relation that defines the values that those variables can take on
#### 6.1.1 Example Problem: Map Coloring
* Suppose we want to color the map of Australia using red, green, and blue such that no neigboring regions have the same color
* To formulate a constraint satisfaction problem, we define:
  * The variables: X = set of regions = {WA, NT, Q, NSW, V, SA, T}
  * The domain of each variable: D<sub>i</sub> = {red, green, blue}
  * The constraints: C = {SA ≠ WA, SA ≠ NT, SA ≠ Q, SA ≠ NSW, SA ≠ V, WA ≠ NT, NT ≠ Q, Q ≠ NSW, NSW ≠ V}
  * [Create a constraint graph](Images/constraint.PNG)
#### 6.1.2 Example Problem: Job-Shop Scheduling
* Variables: X = {Axle<sub>F</sub>, Axle<sub>B</sub>, Wheel<sub>RF</sub>, Wheel<sub>LF</sub>, Wheel<sub>RB</sub>, Wheel<sub>LB</sub>, Nuts<sub>RF</sub>, Nuts<sub>LF</sub>, Nuts<sub>RB</sub>, Nuts<sub>LB</sub>, Cap<sub>RF</sub>, Cap<sub>LF</sub>, Cap<sub>RB</sub>, Cap<sub>LB</sub>, Inspect}
* Precedence constraints: For example, Axle<sub>F</sub> must be put on before Wheel<sub>RF</sub>
* Assume the assembly must be done in 30 minutes: D<sub>i</sub> = {1, 2, 3, ..., 27}
#### 6.1.3 Variations on the CSP formalism
* A constraint involving an arbitrary number of variables is a **global constraint**
  * Example: cryptarithmetic
### 6.2 Constraint Propagation: Inference in CSPs
* Using the constraints to reduce the number of legal values of a variable is constraint propagation. In turn, this can reduce the legal values for another variable, and so on
#### 6.2.1 Node Consistency
* A single variable (corresponding to a node in the CSP network) is node-consistent if all the values in the variable's domain satisfy the variable's unary constraints
#### 6.2.2 Arc Consistency
* A  variable (corresponding to a node in the CSP network) is arc-consistent if all the values in the variable's domain satisfy the variable's binary constraints
#### 6.2.3 Path Consistency
* Path consistency tightens the binary constraints by using implicid constraints that are infirred by looking at triples of variables
#### 6.2.4 K-Consistency
* A CSP is k-consistent if, for any set of `k - 1` variables and for any consistent assignment to those variables, a consistent value can always be assigned to any k<sup>th</sup> variable
  * 1-consistency says that, given the empty set, we can make any set of one variable consistent (ie. node consistent)
* A CSP is strongly k-consistent if it is k-consistent and also (k-1)-consistent, (k-2)-consistent... all the way down to 1-consistent
#### 6.2.5 Global Constraints
* Involve an arbitrary number of variables
### 6.3 Backtracking Search for CSPs
* CSPs are commutative if the order of application of any given set of actions has no effect on the outcome. All CSPs are commutative because when assigning values to variables, we reach the same parital assignment regardless of order
  * Therefore, we only need a single variable at each node in the search tree
* **Backtracking search** defines a depth-first search that chooses values for one variable at a time and backtracks when a variable has no legal values left to assign
#### 6.3.1 Variable and Value Ordering
* Choose the next unassigned variable in order for `SelectUnassignedVariable(csp)`
* Choosing the variable with the fewest "legal" values is called the *minimum-remaining-values* heuristic
#### 6.3.2 Interleaving Search and Inference
* Simplest form of inference is *forward checking*; when a variable X is assigned, the forward-checking process establishes arc consistency for it
#### 6.3.3 Intelligent Backtracking: Looking Backward
* BAcking up to the preceding variable and trying a differenct value when a branch of the search fails is called *chronological backtracking* because the most recent decision point is revisited
### 6.5 The Structure of Problems
* To solve a tree-structured CSP, pick any variable to be the root of the tree. Choose any ordering of the variables such that each variable appears after its parent in the tree. This is called a **topological sort**
* General algorithm:
  1. Choose a subset S of the CSP's variables such that the constraint graph becomes a tree after removal of S. S is called a *cycle cutset*
  2. For each possible assignment to the variables in S that satisfies all constraints on S:
     1. Remove from the domains of the remaining variables any values that are inconsistent with the assignment for S
     2. If the remaining CSP has a solution, return it together with the assignment for S
