(defpackage :morse
  (:use :common-lisp))
(in-package :morse)

(defparameter *morse-mapping*
  '((#\A ".-")
    (#\B "-...")))

(defun character-to-morse (character)
  (second (assoc character *morse-mapping* :test #'char-equal)))

(character-to-morse #\B)
