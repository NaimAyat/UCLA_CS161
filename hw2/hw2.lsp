;;;;;;;;;;;;;;
; Homework 2 ;
;;;;;;;;;;;;;;

;;;;;;;;;;;;;;
; Question 1 ;
;;;;;;;;;;;;;;

; Takes a single argument FRINGE that represents a list of search trees, and
; returns a top-level list of leaf nodes, in the order they are visited by 
; left-to-right breadth-first search. The inital call to BFS passes a FRINGE 
; list with a single element: the root of the search tree.
(defun BFS (FRINGE)
    ; Current node is null. Return nil.
    (cond ((null FRINGE) ())
          ; Is the car of current node a list? If so, recursively call BFS 
          ; to append its car to its cdr. 
          ((listp (car FRINGE)) (BFS (append (cdr FRINGE) (car FRINGE))))
          ; Else, recursively call BFS on the cdr of current node and 
          ; append to car.
          (T (cons (car FRINGE) (BFS (cdr FRINGE))))
    )    
)

;; QUESTION 1 TEST CASES:

; (print (BFS '(ROOT)))
;; Returns: (ROOT)

; (print (BFS '((((L E) F) T))))
;; Returns: (T F L E)

; (print (BFS '((R (I (G (H T)))))))
;; Returns: (R I G H T)

; (print (BFS '(((A (B)) C (D)))))
;; Returns: (C A D B)

; (print (BFS '((T (H R E) E))))
;; Returns: (T E H R E)

; (print (BFS '((A ((C ((E) D)) B))))) 
;; Returns: (A B C D E)


;;;;;;;;;;;;;;
; Question 2 ;
;;;;;;;;;;;;;;


; These functions implement a depth-first solver for the homer-baby-dog-poison
; problem. In this implementation, a state is represented by a single list
; (homer baby dog poison), where each variable is T if the respective entity is
; on the west side of the river, and NIL if it is on the east side.
; Thus, the initial state for this problem is (NIL NIL NIL NIL) (everybody 
; is on the east side) and the goal state is (T T T T).

; The main entry point for this solver is the function DFS, which is called
; with (a) the state to search from and (b) the path to this state. It returns
; the complete path from the initial state to the goal state: this path is a
; list of intermediate problem states. The first element of the path is the
; initial state and the last element is the goal state. Each intermediate state
; is the state that results from applying the appropriate operator to the
; preceding state. If there is no solution, DFS returns NIL.
; To call DFS to solve the original problem, one would call 
; (DFS '(NIL NIL NIL NIL) NIL) 
; However, it should be possible to call DFS with a different initial
; state or with an initial path.

; First, we define the helper functions of DFS.

; FINAL-STATE takes a single argument S, the current state, and returns T if it
; is the goal state (T T T T) and NIL otherwise.
(defun FINAL-STATE (S)
    ;; Goal state found. Otherwise nil by default.
    (equal S '(T T T T))
)

; NEXT-STATE returns the state that results from applying an operator to the
; current state. It takes three arguments: the current state (S), and which entity
; to move (A, equal to h for homer only, b for homer with baby, d for homer 
; with dog, and p for homer with poison). 
; It returns a list containing the state that results from that move.
; If applying this operator results in an invalid state (because the dog and baby,
; or poisoin and baby are left unsupervised on one side of the river), or when the
; action is impossible (homer is not on the same side as the entity) it returns NIL.
; NOTE that next-state returns a list containing the successor state (which is
; itself a list); the return should look something like ((NIL NIL T T)).
(defun NEXT-STATE (S A)
          ; Homer alone
    (cond ((equal A 'h)
                  ; Invalid; baby will be alone with dog or poison
           (cond ((and (equal (first S) (second S)) (or (equal (second S) (third S)) (equal (second S) (fourth S)))) ())
                  ; Otherwise valid.
                  (T (list (cons (NOT (car S)) (cdr S))))))
          
          ; Homer and baby
          ((equal 'b A) 
           ; If Homer with baby, switch them
           (cond ((equal (first S) (second S)) (list (list (not (first S)) (not (second S)) (third S) (fourth S))))
                  ; Invalid; homer not with baby.
                  (T ())))
          
          ; Homer and dog
          ((equal A 'd)
                  ; Invalid; Homer not with dog
           (cond ((not (equal (car S) (third S))) ())
                  ; Invalid; baby will be with poison
                  ((equal (second S) (fourth S)) ())
                  ; Valid
                  (T (list (list (NOT (car S)) (second S) (NOT (third S)) (fourth S))))))
          
          ; Homer and poison
          ((equal A 'p) ;
                  ; Invalid; Homer not with poison
           (cond ((not (equal (car S) (fourth S))) ())
                  ; Invalid; dog will be with baby
                  ((equal (second S) (third S)) ())
                  ; Valid
                  (T (list (list (NOT (car S)) (second S) (third S) (NOT (fourth S)))))))
           
          ; This should never happen
          (T ())
    )
)

; SUCC-FN returns all of the possible legal successor states to the current
; state. It takes a single argument (s), which encodes the current state, and
; returns a list of each state that can be reached by applying legal operators
; to the current state.
(defun SUCC-FN (S)
    ; Append each possible subsequent state to a list
    (append (NEXT-STATE S 'h) (NEXT-STATE S 'b) (NEXT-STATE S 'd) (NEXT-STATE S 'p))
)

; ON-PATH checks whether the current state is on the stack of states visited by
; this depth-first search. It takes two arguments: the current state (S) and the
; stack of states visited by DFS (STATES). It returns T if s is a member of
; states and NIL otherwise.
(defun ON-PATH (S STATES)
    ; Current state not on stack
    (cond ((null STATES) ())
           ; Current state on stack
           (T (cond ((equal (car STATES) S) T)
              ; Recurse through states
              (T (ON-PATH S (cdr STATES)))
              )
           )
    )
)

; MULT-DFS is a helper function for DFS. It takes two arguments: a list of
; states from the initial state to the current state (PATH), and the legal
; successor states to the last, current state in the PATH (STATES). PATH is a
; first-in first-out list of states; that is, the first element is the initial
; state for the current search and the last element is the most recent state
; explored. MULT-DFS does a depth-first search on each element of STATES in
; turn. If any of those searches reaches the final state, MULT-DFS returns the
; complete path from the initial state to the goal state. Otherwise, it returns
; NIL.
(defun MULT-DFS (STATES PATH)
    ; All states exhausted
    (cond ((null STATES) ())
           ; Store current state result
           (T (let ((res (DFS (car STATES) PATH)))
              ; Recursively search state elements
              (cond ((null res) (MULT-DFS (cdr STATES) PATH))
		    ;; State element matches result
		    (T res)
              )
            )
           )
    )
)

; DFS does a depth first search from a given state to the goal state. It
; takes two arguments: a state (S) and the path from the initial state to S
; (PATH). If S is the initial state in our search, PATH is set to NIL. DFS
; performs a depth-first search starting at the given state. It returns the path
; from the initial state to the goal state, if any, or NIL otherwise. DFS is
; responsible for checking if S is already the goal state, as well as for
; ensuring that the depth-first search does not revisit a node already on the
; search path.
(defun DFS (S PATH)
    ; State matches goal; append to path
    (cond ((FINAL-STATE S) (append PATH (list S)))
          ; State has already been checked; do nothing
          ((ON-PATH S PATH) ())
          ; Final state not yet found
          (T (MULT-DFS (SUCC-FN S) (append PATH (list S))))
    )
)

;; QUESTION 2 TEST CASES:

; (print (DFS '(T () T ()) ())) 
;; Returns: ((T NIL) (NIL NIL) (T T NIL NIL) (NIL T NIL NIL) (T T T NIL) 
;; (NIL NIL T NIL) (T NIL T T) (NIL NIL T T) (T T T T)) 

; (print (DFS '(T T T T) ())) 
;; Returns: ((T T T T)) 

; (print (DFS '(() () () T) ())) 
;; Returns: ((NIL NIL NIL T) (T T NIL T) (NIL T NIL NIL) (T T T NIL) 
;; (NIL NIL T NIL) (T NIL T T) (NIL NIL T T) (T T T T)) 

; (print (DFS '(() () () ()) ()))
;; Returns: ((NIL NIL NIL NIL) (T T NIL NIL) (NIL T NIL NIL) (T T T NIL) 
;; (NIL NIL T NIL) (T NIL T T) (NIL NIL T T) (T T T T))  