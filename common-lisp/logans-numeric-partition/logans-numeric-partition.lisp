(defpackage :logans-numeric-partition
  (:use :cl)
  (:export :categorize-number :partition-numbers))

(in-package :logans-numeric-partition)

(defun categorize-number (lst n)
  (if (oddp n)
    (reduce #'cons lst :initial-value (list n))
    (reduce #'cons (cdr lst) :initial-value (cons (car lst) (list n)))))

;; Define partition-numbers function
; (defun partition-numbers (lst)
;   (if (oddp (car lst))
;     (reduce #'categorize-number (cdr lst) :initial-value (car lst))
;     (reduce #'categorize-number (cdr lst) :initial-value (car lst)))

(defun partition-numbers (lst)
  (reduce #'categorize-number (cdr lst) :initial-value (car lst)))
