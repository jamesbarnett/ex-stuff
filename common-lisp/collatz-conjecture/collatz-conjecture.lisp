(defpackage :collatz-conjecture
  (:use :cl)
  (:export :collatz))

(in-package :collatz-conjecture)

(defun collatz (n &optional (steps 0))
  (if (plusp n)
    (case n
      (1 steps)
      (2 (1+ steps))
      (t (cond ((evenp n)
                (collatz (/ n 2) (1+ steps)))
               (t
                (collatz (+ (* 3 n) 1) (1+ steps))))))
    nil))
