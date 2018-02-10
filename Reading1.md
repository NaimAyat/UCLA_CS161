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
