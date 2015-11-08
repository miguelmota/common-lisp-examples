(cons `w `(x y z)) ; => (W X Y Z)

(append `(friends romans) `(and countrymen))

(setf who `(only the good))
(append who `(die young))

(cons `rice `(and beans)) ; (RICE AND BEANS)
(list `rice `(and beans)) ; (RICE (AND BEANS))
(append `rice `(and beans)) ; Error: RICE is not a list

(cons `(eat at) `joes) ; ((EAT AT) . JOES)
(list `(eat at) `joes) ; ((EAT AT) JOES) ; as is
(append `(eat at) `joes) ; (EAT AT . JOES)

(reverse `(l i v e)) ; (E V I L)

(defun add-to-end (x y)
  (reverse (cons y (reverse x)))
  )

(add-to-end `(a b c) `d) ; (A B C D)

(nthcdr 0 `(a b c)) ; (A B C)
(nthcdr 1 `(a b c)) ; (B C)
(nthcdr 3 `(a b c)) ; NIL

(defun nth (n x)
  "Returns the Nth element of the list X, counting from 0."
  (car (nthcdr n x))
  )

(nth 1 `(a b c)) ; (B)

(last `(all is forgiven)) ; (FORGIVEN)
(last `(a b c . d)) ; (C . D)

(remove `a `(b a n a n a)) ; (B N N)

(setf ducks `(huey dewey louie)) ; create set
(member `huey ducks) ; is huey a duck? (HUEY DEWEY LOUIE)

(defun beforep (x y l)
  "Returns true if X appears before Y in L"
  (member y (member x l))
  )

(beforep `not `whom `(ask not for whom the bell tolls)) ; (WHOM THE BELL TOLLS)

(intersection `(fred john mary) `(sue mary fred)) ; (FRED MARY)

(union `(fred john mary) `(sue mary fred)) ; (FRED MARY JOHN SUE)

(set-difference `(alpha bravo charlie delta) `(bravo charlie)) ; (ALPHA DELTA)

(subsetp `(a i) `(a e i o u)) ; t

(defun titledp (name)
  (member (first name) `(mr ms miss mrs))
  )
(titledp `(jane doe)) ; NIL
(titledp `(ms jane doe)) ; (MS MISS MRS)

(setf male-first-names
      `(john kim richard fred george)
      )

(setf female-first-names
      `(jane mary wanda barbara kim)
      )

(defun malep (name)
  (and (member name male-first-names)
       (not (member name female-first-names))
       )
  )

(malep `richard) ; T

(defun femalep (name)
  (and (member name female-first-names)
       (not (member name male-first-names))
       )
  )

(femalep `barbara) ; T

(defun give-title (name)
 "Returns a name with an appropriate title on the front."
 (cond ((titledp name) name)
       ((malep (first name)) (cons `mr name))
       ((femalep (first name)) (cons `ms name))
       (t (append `(mr or ms) name))
       ))

(give-title `(barbara smith)) ; (MS BARBARA SMITH)
(give-title `(kim johnson)) ; (MR OR MS KIM JOHNSON)

(defun gender-ambigous-names ()
  (intersection male-first-names female-first-names)
  )

(gender-ambigous-names)

(defun uniquely-male-names ()
  (set-difference male-first-names female-first-names)
  )

(uniquely-male-names) ; (JOHN RICHARD FRED GEOGE)

; a table (association list). keys are english words
(setf words `(
              (one un)
              (two deux)
              (three trois)
              (four quatre)
              (five cinq)
              ))

; look up entry given its key
(assoc `three words) ; => (THREE TROIS)

(defun translate (x)
  (second (assoc x words))
  )

(translate `one) ; => un

(setf sounds
      `(
        (cow . moo)
        (pig . oink)
        (cat . meow)
        (dog . woof)
        (bird . tweet)
        )
      )

(rassoc `woof sounds) ; => (DOG . WOOF)

(setf things
     `(
       (object1 large green shiny cube)
       (object2 small red dull meta cube)
       (object3 red small dull plastic cube)
       (object4 small dull blue meta cube)
       (object5 small shiny red four-sided pyramid)
       (object6 large shiny green sphere)
       )

      )

(defun description (x)
  (rest (assoc x things))
  )

(description `object3) ; => (RED SMALL DULL PLASTIC CUBE)

(defun differences (x y)
  (set-exclusive-or (description x)
                    (description y)
                    )
  )

(differences `object2 `object3) ; => (METAL PLASTIC)

(setf quality-table
      `((large . size)
        (small . size)
        (red . color)
        (green . color)
        (blue . color)
        (shiny . luster)
        (dull . luster)
        (metal . material)
        (plastic . material)
        (cube . shape)
        (sphere . shape)
        (pyramid . shape)
        (four-sided . shape)
        )
      )

(defun quality (x)
  (cdr (assoc x quality-table))
  )

(quality `red) ; => COLOR

(defun quality-difference (x y)
  (quality (first (differences x y)))
  )

(quality-difference `object1 `object6) ; => SHAPE
