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
