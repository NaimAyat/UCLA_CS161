# Lab 1 (Jan 12, 2018)
## Lisp Syntax
###  `car` and `cdr`
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
Defines a function `test` that returns `5`; the last line of the function is always the return value.
```
(defun fact(x)
  (if (> x 0) 
    fact(* x (fact(- x 1)))
  1
  )
)
```
Defines a function `fact` to recursively calculate the factorial of a positive integer `x`.

### `set` and `setq`
```
(set 'a '(1 2 3))
```
Sets the value of variable `a` to the list `'(1 2 3)`.
```
(setq b '(4 5 6))
```
Sets the value of the variable `b` to the list `'(4 5 6)`. The difference is that the first argument is automatically quoted by `setq`.

### `append`
```
(append '(1 2 3) '(4 5 6))
```
Combines each argument and return the list `(1 2 3 4 5 6)`.
### Boolean Functions
* `list` returns `T` if the argument is a list and `NIL` if it is not.
* `atom` returns `T` if the argument is an atom and `NIL` if it is not. Note: every single element is an atom.
* `symbolp` returns `T` if the argument is a symbol and `NIL` if it is not. Note: every non-numeric element is a symbol.
* `oddp` returns `T` if the argument is an odd integer and `NIL` if it is not.
* `evenp` returns `T` if the argument is an even integer and `NIL` if it is not.
