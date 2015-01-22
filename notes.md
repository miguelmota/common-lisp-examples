## Chapter 1

ABS
SQRT

Floating point (notation) = with decimal point

ratios, always simplified

3/6 = 1/2
2/6.0 = 0.5

symbols, ex. SQRT, 7-12, TUESDAY-BANANAS, may contain [0-9A-Z-]
T = true
NIL = emptiness, false
yes/no answer functions called predicates

NUMBERP (predicate)
SYMBOLP
ZEROP
EVENP
ODDP
< also predicate symbol
>
EQUAL

Built in functions called primitives (functions)

NOT

Truth functions, are whose inputs are true/false, like NOT

when / given single input, returns reciprocal, ex. 4.0 / = 0.25, (or 1/4.0)

LISP = list processing
symbols and lists - important for AI

## Chapter 2

(RED GREEN BLUE) - a list

lists organized as chains of **cons cells**, linked togehter by **pointers**
nested lists, flat lists (not nested)

LENGTH
() - empty list, no cons cells, NIL
(A NIL B) EQUAL (A () B)
NIL is only thing that is a symbol and a list, has length
FIRST, SECOND, THIRD - primitive functions, returns item at index from list
REST

CAR - Contents of Address portion of Register
CDR - Contents of Decrement portion of Register
aboves returns whatever is in cell halves
FIRST returns the CAR of a list, and REST returns the CDR
CADR - CAR of the CDR - ex. (FEE FIE FOE FUM) -> CADR -> FIE
CDAR - CDR of the CAR - ((FEE FIE)(FOE FUM)) -> CDAR -> FIE
CADDR - THIRD element from list, CAR of the CDR of the CDR
page. 28 table
CAAR - CAR of CAR

CONS - creates cons cells, short for CONStruct, takes two inputs, returns pointer for new cons cell CAR (head)
CONS adds element to the front of a list, SINK CONS (OR SWIM) (SINK OR SWIM)
CONS will always return a nested list if first input is nonempty list
CONS BAZ NILL -> (BAZ), CONS (BAZ) BAR -> (BAR BAZ)
CONS of (CAR of x) and (CDR of x)

LIST - creates list of inputs
CONS makes a single cons cell
LIST makes new cons cell chain out of number of inputs

LISTP - predicate
CONSP - T if input is a cons cell. NIL is a list, but not a cons cell
ATOM - T if input anything other than cons cell. opposite of CONSP
(atomic) can't take apart. FIRST/REST take apart list
NULL to test if list is empty

A proper list is a cons cell chain ending in NIL
printed dotted list - (A B C . D) # ends in D instead of NIL
for dotted lists CONS must be used. CONS A B -> (A . B)

#1=(#1# . A) - infinite loop pointing to CARS
(A B C . D) - length is 3
(A B C . NIL) - length 3

## Chapter 3

Eval notation - evaluate lisp expressions. ex. (+ 1 2 3)
Functions are data
Numbers, T, and NIL are self-evaluating

eval, first element is function to call, rest are arguments

DEFUN - macro function, define function
(defun average (x y) (/ (+ x y) 2.0))
(average  2 3) ; 2.5

variables are not symbols, variables are named by symbols

pi variable is global

Use quote to refrence literal value
(equal 'kirk 'spock)

ctrl+u - discard line in REPL (read eval print loop)

QUOTE - returns input
SYMBOL-NAME
SYMBOL-FUNCTION
LAMBDA
(lambda (x) (+ 3 x))

scope, local

EVAL - primitive, one level of evaluation
APPLY
Apply objects are not evaluated first

# Chapter 4
IF - (IF COND TRUEFN FALSEFN)

COND - return first truthy value

AND - (AND (x 1 < 2))
AND returns nil or last value if all pass
(and 1 2 3 4 5) ; => 5

OR - (OR (> x y))
OR returns first value that is not nil
(or `george nil `harry) ; => george

PLUSP - number positive
NUMBERP - is number

IF easiest for small functions like absolute value
AND and OR are good for complex predicates
COND is easiest for when there are many tests

good practice to have (T value) as last COND to be catch-all

(STEP (my-func x)) ; debugger, type ? for commands


DeMorgan's Theorem - AND and OR are interchangeable if you have NOT

(and x y) = (not (or (not x) (not y)))
(or x y) = (not (and (not x) (not y)))

Chapter #5
Every variable has a scope
local variables: restricted to function scope
SETF - set variable, overrides, it's a macro
(setf vowels `(a e i o u))
DEFVAR - declare variable, usually before setf
(defvar trowels)

RANDOM n - up to but not including n

(list (random 5) (random 5)) ; (4 1)
(list (random 5.0) (random 5.0)) ; (0.7023904 0.8569303)

LET - local variable
(let ((var-1 value-1) (var-2 value-2)) body)

LET itself is not a real primitive in a functional language, since it can replaced with LAMBDA. Like this:

(let ((a1 b1) (a2 b2) ... (an bn))
  (some-code a1 a2 ... an))
is similar to

((lambda (a1 a2 ... an)
   (some-code a1 a2 ... an))
 b1 b2 ... bn)
But

(let* ((a1 b1) (a2 b2) ... (an bn))
  (some-code a1 a2 ... an))
is similar to

((lambda (a1)
    ((lambda (a2)
       ...
       ((lambda (an)
          (some-code a1 a2 ... an))
        bn))
      b2))
   b1)

Sometimes more efficient to use LET instead of LET* but be careful.

DOCUMENTATION - return documentation string for function

(defun average (x y)
  "Returns the mean (average value) of its two inputs."
    (/ (+ x y) 2.0))

(documentation `average `function)

APROPOS - lists names of all symbols containing a specified string. Second argument is package name. Always use "USER"
(apropos "TOTAL" "USER")
ARRAY-TOTAL-SIZE                           function
ARRAY-TOTAL-SIZE-LIMIT                     constant
