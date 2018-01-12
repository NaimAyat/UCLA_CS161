# Lab 1 (Jan 12, 2018)
## Lisp Syntax
###  `car` & `cdr`
```
(car '(1 2 3))
```
Returns the first element of the list, `1`.

```
(cdr '(1 2 3))
```
Returns the elements of the list excluding the first, `2 3`.

```
(setq a '((1 2) 3))
```
Assigns `a` the value `'((1 2) 3)`.

```
(car (cdr (car a)))
```
This statement now returns `2`. It can be shortened to:
```
(cadar a)
```
Note that any combination of `car`/`cdr` can be written as a single word with alternating `a`s and `d`s between the `c` and  `r`. 

### `cons`
```
(cons '1 '(2 3 4))
```
Constructs the list `(1 2 3 4)`.

### `defun`
```
(defun test()
  (+ 1 2)
  (+ 2 3)
)
```
Defines a function that returns `5`; the last line of the function is always the return value.
