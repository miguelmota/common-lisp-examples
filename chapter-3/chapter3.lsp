(defun riddle (x y) (list 'why 'is 'a x 'like 'a y))

(riddle 'raving 'writing-desk)

(first `(we hold these thruths)) ; (WE)

(cons 'a '(b c)) ; (A B C)

(rest `(cons is short for construct)) ; (IS SHORT FOR CONSTRUCT)

(cons 5 (list 6 7)) ; (5 6 7)

(quote foo) ; foo

(symbol-name 'equal) ; "EQUAL"

(apply #'+ '(2 3)) ; 5

(apply #'+ '(2 3)) ; 3

; would cause an error if not for apply
(apply #'cons '(as (you like it))) ; (AS YOU LIKE IT)
