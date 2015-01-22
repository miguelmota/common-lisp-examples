(if (oddp 2) 'odd 'even)

(defun my-abs (x)
    (if (< x 0) (- x) x))

(my-abs -5) ; 5

(defun compare (x y)
  (cond ((equal x y) 'numbers-are-the-same)
        ((< x y) 'first-is-smaller)
        ((> x y) 'first-is-bigger)))

(compare 1 2) ; first-is-smaller

(defun where-is (x)
  (cond ((equal x 'paris) 'france)
        ((equal x 'london) 'england)
        ((equal x 'beijing) 'china)
        (t 'unknown)))

(where-is 'LA) ; unknown

(defun emphasize (x)
  (cond ((equal (first x) 'good) (cons 'great (rest x)))
        ((equal (first x) 'bad) (cons 'awful (rest x)))
        (t x)
  ))

(emphasize '(good mystery story))

(defun compute (op x y)
  (cond ((equal op 'sum-of) (+ x y))
        ((equal op 'product-of) (* x y))
        (t '(that does not compute))))

(compute 'sum-of 3 7)

(defun small-positive-oddp (x)
  (and  (< x 100)
        (> x 0)
        (oddp x)))

(small-positive-oddp 99)

(defun gtest (x y)
  (or (> x y)
  (zerop x)
  (zerop y)))

(gtest 6 5)

(and nil t t) ; => nil
(and `george nil `harry) ; => nil
(and `george `fred `harry) ; => harry
(and 1 2 3 4 5) ; => 5

(or nil t t) ; => t
(or `george nil `harry) ; => george
(or nil `fred `harry) ; => fred

(defun how-alike (a b)
  (cond  ((equal a b) `the-same)
         ((and (oddp a) (oddp b)) `both-odd)
         ((and (not (oddp a)) (not (oddp b))) `both-even)
         ((and (< a 0) (< b 0)) `both-negative)
         (t `not-alike)
  )
)

(how-alike 7 7) ; => the-same

(defun same-sign (x y)
  (or (and (zerop x) (zerop y))
      (and (< x 0) (< y 0))
      (and (> x 0) (> y ))
  )
)

(same-sign -5 -3)

(defun posnump (x)
  (and (numberp x) (plusp x))
)

(posnump 3)

(defun postnum-2 (x)
  (if (numberp x) (> x 0) nil)
)

(postnum-2 4)

(defun postnum-3 (x)
  (cond ((numberp x) (> x 0))
        (t nil))
)

(postnum-3 4)
(postnum-3 -2)

(defun where-is (x)
  (cond ((equal x `paris) `france)
        ((equal x `london) `england)
        ((equal x `beijing) `china)
        (t `unkown)
  )
)

(where-is `paris)

(defun where-is-2 (x)
  (if (equal x `paris) `france
    (if (equal x `london) `england
      (if (equal x `beijing) `china
         `unknown
  )))
)

(where-is-2 `beijing)

(defun where-is-3 (x)
  (or (and (equal x `paris) `france)
        (and (equal x `london) `england)
        (and (equal x `beijing) `china)
        `unkown
  )
)

(where-is-3 `london)

(defun logical-and (x y)
  (and x y t)
)

(defun demorgan-and (x y)
  (not (or (not x) (not y)))
)

(defun demorgan-or (x y)
  (not (and (not x) (not y)))
)


(demorgan-and t nil)
(demorgan-or t nil)
