# Lab 2 (January 19, 2018)
## Search Types
* Uninformed search
* [BFS](https://upload.wikimedia.org/wikipedia/commons/5/5d/Breadth-First-Search-Algorithm.gif)
* Uniform-cost search
* [DFS](https://upload.wikimedia.org/wikipedia/commons/7/7f/Depth-First-Search.gif)
* Depth-limited search
* Iterative deepening DFS
* Informed search
## DFS Lisp Implementation
* Example input: `(a ((b (d (e (h)))) (c (f g))))`
* Example output: `(a b d e h c f g)`
```
(defun dfs (tree)
  (if (atom tree)
    (if tree
      (list tree)
      '()
    )
    (append (dfs (first tree)) (dfs (first (second tree))) (dfs (second (second tree))))
  )
)
```
## BFS Lisp Implementation
* Example input: `(a ((b (d (e (h)))) (c (f g))))`
* Example output: `(a b d e h c f g)`
```
(defun bfs (tree)
  (cond
    ((listp tree)
      (cond
        ((null tree) '())
        ((listp (first tree)) (bfs (append (cdr tree) (car tree))))
        (t (append (list (car tree)) (bfs (cdr tree))))
      )
    )
    ( t tree)
  )
)
```
