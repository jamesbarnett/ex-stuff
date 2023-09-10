(defpackage :larrys-winning-checker
  (:use :cl)
  (:export
   :make-empty-board
   :make-board-from-list
   :all-the-same-p
   :row
   :column))

(in-package :larrys-winning-checker)

(defun make-empty-board ()
  (make-array '(3 3) :initial-element nil))

(defun make-board-from-list (list)
  (make-array '(3 3) :initial-contents list))

(defun generate-range (n)
  (loop for num from 0 to (- n 1) collect num))

(defun all-the-same-p (row-or-col)
  (and (eq (aref row-or-col 0) (aref row-or-col 1))
       (eq (aref row-or-col 1) (aref row-or-col 2))))

(defun row (board row-num)
  (map 'vector (lambda (x) (aref board row-num x)) (generate-range 3)))

(defun column (board col-num)
  (map 'vector (lambda (x) (aref board x col-num)) (generate-range 3)))
