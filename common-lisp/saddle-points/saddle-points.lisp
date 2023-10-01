(defpackage :saddle-points
  (:use :cl)
  (:export :saddle-points
           :make-range
           :row
           :column
           :max-positions
           :min-positions
           :indices-of-max-values
           :min-col-position
           :max-row-positions
           :min-col-positions))

(in-package :saddle-points)

(defun make-range (n)
  (loop for num from 0 below n collect num))

(defun row (row-num matrix)
  (loop for n below (array-dimension matrix 0)
      collecting (aref matrix (1- row-num) n) into rows
  finally (return rows)))

(defun column (col-num matrix)
  (loop for n below (array-dimension matrix 1)
      collecting (aref matrix (1- col-num) n) into cols
  finally (return cols)))

(defun positions-for-row (n arr)
  (mapcar (lambda (x) (list n (1+ x)))
          (make-range (length arr))))

(defun positions-for-col (n arr)
  (mapcar (lambda (x) (list (1+ x) n))
          (make-range (length arr))))

(defun max-positions (n arr)
  (remove-if-not (lambda (x) (eq (nth (1- (cadr x)) arr) (max-array-value arr)))
                   (positions-for-row n arr)))

(defun min-positions (n arr)
  (remove-if-not (lambda (x) (eq (nth (1- (car x)) arr) (min-array-value arr)))
                 (positions-for-col n arr)))

(defun max-row-positions(matrix)
  (mapcan (lambda (x) (max-positions (1+ x) (row (1+ x) matrix)))
          (make-range (array-dimension matrix 0))))

(defun min-col-positions(matrix)
  (mapcan (lambda (x) (min-positions (1+ x) (column (1+ x) matrix)))
          (make-range (array-dimension matrix 1))))

(defun max-array-value (arr)
  (apply #'max arr))

(defun min-array-value (arr)
  (apply #'min arr))

(defun saddle-points (matrix)
  (if (some (lambda (x) (= x 0)) (array-dimensions matrix))
    ()
    (let ((maxes (max-row-positions matrix))
          (mins (min-col-positions matrix)))
      (intersection maxes mins :test 'equal))))
