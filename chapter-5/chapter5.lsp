(setf vowels `(a e i o u))

(length vowels)

(rest vowels)

(defvar trowels)

(setf long-list `(a b c d e f g h i))
(setf head (first long-list))
(setf tail (rest long-list))
(cons head tail) ; (A B C D E F G H I)

(equal long-list (cons head tail))
(list head tail)

(list (random 5) (random 5))

(list (random 5.0) (random 5.0))

(defun average (x y)
  (let ((sum (+ x y)))
    (list x y `average `is (/ sum 2.0))
    )
  )

(average 3 7)

(defun switch-billing (x)
  (let ((star (first x))
        (co-star (third x)))
    (list co-star `accompanied `by star)
    )
  )

(switch-billing `(fred and ginger))

(defun price-change (old new)
  (let* ((diff (- new old))
         (proportion (/ diff old))
         (percentage (* proportion 100.0)))
    (list `widgest `changed `by percentage` `percent)
    )
  )

(price-change 1.25 1.35)

(print (let ((c 1))
         (let ((c 2)
              (a (+ c 1)))
               a))) ; 2

(print (let ((c 1))
         (let* ((c 2)
               (a (+ c 1)))
                a))) ; 3

(defun size-range (x y z)
  (let* ((biggest (max x y z))
         (smallest (min x y z))
         (r (/ biggest smallest 1.0))
         )
    (list `factor `of r)
    )
  )

(size-range 35 87 4)

(defun fair-coin ()
  (let ((toss (random 101)))
    (cond ((< toss 50) `head)
          ((> toss 50) `tails)
          (t `edge)
          )
    )
  )

(fair-coin)

(defun average (x y)
  "Returns the mean (average value) of its two inputs."
  (/ (+ x y) 2.0))

(documentation `average `function)

; comment convention

;;; Function to compute Ensteins' E = mc2

(defun einstein (m)
 (let ((c 300000.0))) ; speed of light in km/sec.
 ;; E is energy
 ;; m is mass
 (* m c c)
  )
