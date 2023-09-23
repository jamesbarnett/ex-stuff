(defpackage :difference-of-squares
  (:use :cl)
  (:export :sum-of-squares
           :square-of-sum
           :difference))

(in-package :difference-of-squares)

(defun square-of-sum (n)
  (defun square (x)
    (* x x))
  (square (reduce #'+ (loop for i upto n collect i) :initial-value 0)))

(defun sum-of-squares (n)
  (reduce #'+ (loop for i upto n collect (* i i)) :initial-value 0))

(defun difference (n)
  (- (square-of-sum n) (sum-of-squares n)))
