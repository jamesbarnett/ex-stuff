(defpackage :darts
  (:use :cl)
  (:export :score))

(in-package :darts)


(defun between (x lo hi)
  (if (= lo 0)
    (and (>= x lo) (<= x hi))
    (and (> x lo) (<= x hi))))

(defun score-from-distance(d)
  (cond ((between d 0 1.0) 10)
        ((between d 1.0 5.0) 5)
        ((between d 5.0 10.0) 1)
        (t 0)))

(defun score (x y)
  (score-from-distance (sqrt (+ (* x x) (* y y)))))
