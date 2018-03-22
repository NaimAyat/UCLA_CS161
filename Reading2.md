# *Artificial Intelligence: A Modern Approach* - Norvig & Russel (2010)
# Chapters 7, 8, 9, 13, 14, 18
## Propositional logic: Sections 7.0–7.6.1
### Chapter 7: Logical Agents
#### 7.1 Knowledge-Based Agents
* Knowledge base = set of sentences; a sentence is also called an axiom when it is taken as a given rather than derived from other sentences
* *Tell*: add sentences to the knowledge base
* *Ask*: query the knowledge base
* Inference: deriving new sentences from old
* *Knowledge level*: specify what the agent knows and what its goals are
* Declarative approach to system building: *tell* the knowledge=based agent what it needs to know until it knows how to operate in its environment
* Procedural approach to system building: encode desired behaviors directly into program code
#### 7.2 The Wumpus World
* Wumpus world: cave consisting of rooms connected by passageways. The wumpus can be shot by an agent, but the agent only has one arrow. Some rooms contain pits that will trap the agent.
  * Performance measure: +1000 for climbing out of the cave with gold, -1000 for falling into pit/wumpus, -1 for each action, -10 for using the arrow. Game ends when either the agent dies or climbs out of the cave
  * Environment: 4x4 grid of rooms. The agent always starts at [1,1] facing the right. The locations of gold and wumpus are randomly chosen. Each square other than the start can be a pit, with probability 0.2
  * Actuators: Agent can move forward, turn left, or turn right. The agent dies if it enters a square containing a pit or live wumpus. The agent can use the action *grab* to pick up the gold if it is in the same square as the agent. The action *shoot* shoots an arrow in a straight line in the direction the agent is facing. The agent only has one arrow. *Climb* can be used to climb out of the cave, but only at square [1,1].
  * Sensors: Agent has five sensors, each giving a single bit of info:
    1. In the square containing the wumpus and in the adjacent squares, agent perceives a *stench*
    2. In squares adjacent to a pit, the agent will preceive a *breeze*
    3. In the square with gold, the agent will perceive a *glitter*
    4. When agent walks into a wall, it will perceive a *bump*
    5.  When wumpus is killed, it emits a *scream* that can be perceived anywhere in the cave
    * The percepts will be given to the agent in the form of a list of five symbols. For example, if there is a stench and a breeze, but no glitter, bump, or scream, the agent program will get [Stench, Breeze, None, None, None].
#### 7.3 Logic
* Model: possible world
* If a sentence A is true in model M, then we say M satisfies A or that M is a model of A
  * M(A) means the set of all models of A
* *Entailment*: a sentence follows from another. A |= B means "A entails B"
  * A =| B if and only if M(A) ⊆ M(B)
#### 7.4 Propositional Logic
##### 7.5 Syntax
* [Truth tables for the five logical connectives](http://images.slideplayer.com/26/8636033/slides/slide_20.jpg)
* Operator precedence: ~, ∧, ∨, ->, <->
##### 7.5 Propositional Theorem Proving
* Logical equivalence: two sentences A and B are logically equivalent if they are true in the same set of models. A and B are equivalent if and only iff A <-> B (which is true only if A |= B and B |= A
* Validity: a sentence is valid if it is true in all models. Also known as tautologies
  * For any sentences α and β, α |= β if and only if the sentence (α -> β) is valid
* Satisfiability: sentence is satisfiable if it is true in, or satisfied by, some model
  * α |= β if and only if the sentence (α ∧ ¬β) is unsatisfiable
###### 7.5.1 Inference and Proofs
* Modus Ponens: whenever any sentences of the form α ⇒ β and α are given, then the sentence β can be inferred
* And-Elimination: from a conjunction, any of the conjuncts can be inferred
* [De Morgan's Laws](https://i.ytimg.com/vi/i7NAjjMGIoA/maxresdefault.jpg)
###### Converting to CNF
[Steps for converting to CNF](http://slideplayer.com/slide/5028323/16/images/5/Converting+to+CNF+Any+wff+can+be+converted+to+CNF+by+using+the+following+equivalences:+(1)+A+%E2%86%94+B+%EF%82%BA+(A+%E2%86%92+B)+%CE%9B+(B+%E2%86%92+A).jpg)
###### 7.5.3 Horn clauses and definite clauses
* Definite clause: disjunction of literals of which exactly one is positive
* Horn clause: disjunction of literals of which at most one is positive
* Goal clause: a Horn clause with no positive literals
###### 7.6.1 A complete backtracking algorithm
* Early termination: The algorithm detects whether the sentence must be true or false, even with a partially completed model. A clause is true if any literal is true, even if the other literals do not yet have truth values; hence, the sentence as a whole could be judged true even before the model is complete
* Pure symbol heuristic: A pure symbol is a symbol that always appears with the same “sign” in all clauses. For example, in the three clauses (A ∨ ¬B), (¬B ∨ ¬C), and (C ∨ A), the symbol A is pure because only the positive literal appears, B is pure because only the negative literal appears, and C is impure
* Unit clause heuristic: A unit clause was defined earlier as a clause with just one literal. In the context of Davis–Putnam algorithm, it also means clauses in which all literals but one are already assigned false by the model.
### Chapter 8: First-Order Logic
#### 8.2 Syntax and Semantics of First-Order Logic
* Add objects to propositional logic, which only contains facts
* Domain: set of objects or domain elements a model contains
* A relation is just the set of tuples of objects that are related
  * { <Richard the Lionheart, King John>, <King John, Richard the Lionheart> }
* Certain kinds of relationships are best considered as functions, in that a given object must be related to exactly one object in this way. For example, each person has one left leg, so the model has a unary “left leg” function that includes the following mappings:
  * < Richard the Lionheart > → Richard’s left leg
  * < King John > → John’s left leg
##### 8.2.3 Terms
* A term is a logical expression that refers to an object
* Instead of using a constant symbol, we use LeftLeg(John). In the general case, a complex term is formed by a function symbol followed by a parenthesized list of terms as arguments to the function symbol.
##### 8.2.4 Atomic sentences
* Atomic sentence / atom: formed from a predicate symbol optionally followed by a parenthesized list of terms, such as Brother (Richard , John).
##### 8.2.5 Complex sentences
* We can use logical connectives to construct more complex sentences, with the same syntax and semantics as in propositional calculus
  * Example: ¬Brother (LeftLeg(Richard), John)
##### 8.2.6 Quantifiers
* Universal quantification (∀): all kings are persons (∀x King(x) ⇒ Person(x))
* Existential quantification (∃): there exists some crown on John's head (∃x Crown(x) ∧ OnHead(x, John))
###### Connections between ∀ and ∃
* Asserting that everyone dislikes parsnips is the same as asserting there does not exist someone who likes them, and vice versa
##### 8.2.7 Equality
* We can use the equality symbol to signify that two terms refer to the same object. For example, Father(John) = Henry
#### 8.3 Using First-Order Logic
##### 8.3.1 Assertions and queries in first-order logic
* Sentences are added to a knowledge base using TELL, exactly as in propositional logic. Such sentences are called assertions
* For example, we can assert to our knowledge base that John is a king: TELL(KB, King(John))
### Chapter 9: Inference in First-Order Logic
#### 9.2.1 A first-order inference rule
* The inference that John is evil: {x/John} solves the query Evil(x)
#### 9.2.2 Unification
* Think Prolog
  * UNIFY(Knows(John, x), Knows(John, Jane)) = {x/Jane}
#### 9.5.1 Conjunctive normal form for first-order logic
1. Eliminate Implications
2. Move negations inwards:
   * ¬∀x p becomes ∃x ¬p
   * ¬∃x p becomes ∀x ¬p
3. Standardize variables: For sentences like (∃xP(x))∨(∃xQ(x)) which use the same variable name twice, change the name of one of the variables. This avoids confusion later when we drop the quantifiers. 
4. Skolemize: Skolemization is the process of removing existential quantifiers by elimination. The general rule is that the arguments of the Skolem function are all the universally quantified variables in whose scope the existential quantifier appears. As with Existential Instantiation, the Skolemized sentence is satisfiable exactly when the original sentence is satisfiable.
5. Drop universal quantifiers: At this point, all remaining variables must be universally quantified. Moreover, the sentence is equivalent to one in which all the universal quantifiers have been moved to the left. We can therefore drop the universal quantifiers
6. Distribute ∨ over ∧
### Chapter 13: Quantifying Uncertainty
#### 13.2 Basic Probability Notation
##### 13.2.1 What probabilities are about
* Sample space: set of all possible worlds
* Probability of A given B: P(A|B) = P(A ∧ b) / P(B)
##### 13.2.3 Probability axioms and their reasonableness
* P(a ∨ b) = P(a) + P(b) − P(a ∧ b)
#### 13.5 Bayes' Rule and its Use
* Product rule: P(a ∧ b) = P(a|b)P(b) and P(a ∧ b) = P(b|a)P(a)
* Bayes' rule: P(b|a) = P(a|b)P(b) / P(a)
  * Useful when we know P(a|b), P(b), and P(a) and want to compute P(b|a)
### Chapter 14: Probabilistic Reasoning
#### 14.1 Representing Knowledge in an Uncertain Domain
* A Bayesian network is a directed graph in which each node is annotated with quantitative probability information
  1. Each node corresponds to a random variable
  2. A set of directed links or arrows connects pairs of nodes. If there is an arrow from node X to Y, X is said to be a parent of Y
  3. Each node X<sub>i</sub> has a conditional probability distribution P(X<sub>i</sub>|Parents(X<sub>i</sub>)) that quantifies the effect of the parents on the node
#### 14.2 Semantics of Bayesian Networks
* To construct a Bayesian network:
  1. Nodes: Determine the set of variables that are required to model the domain. Now order them, {X<sub>1</sub>, ... , <sub>n</sub>}. Any order will work, but the resulting network will be more compact if the variables are ordered such that causes precede effects.
  2. Links: for i=1 to n, do:
     * Choose, from X<sub>1</sub>,..., X<sub>i-1</sub>, a minimal set of parents X<sub>i</sub>, such that the equation P(X<sub>i</sub>|X<sub>X-1</sub>...,X<sub>1</sub>) = P(X<sub>i</sub>|Parents(X<sub>i</sub>)) is satisfied
     * For each parent, insert a link from the parent to X<sub>i</sub>
     * CPTs: Write the conditional probability table, P(X<sub>i</sub>|Parents(X<sub>i</sub>))
