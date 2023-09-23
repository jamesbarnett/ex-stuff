(defpackage :hamming
  (:use :cl)
  (:export :distance :moo))

(in-package :hamming)

(defun distance (dna1 dna2)
  (when (eq (length dna1) (length dna2))
    (reduce #'+ (map 'list
                     #'(lambda (x y)
                         (if (eq x y) 0 1))
                     dna1 dna2) :initial-value 0)))
