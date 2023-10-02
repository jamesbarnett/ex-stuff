(defpackage :saddle-points
  (:use :cl)
  (:export :saddle-points))

(in-package :saddle-points)

(defun make-range (n)
  (loop for num from 0 below n collect num))

(defun row (row-num matrix)
  (loop for n below (array-dimension matrix 1)
      collecting (aref matrix row-num n) into rows
  finally (return rows)))

(defun column (col-num matrix)
  (loop for n below (array-dimension matrix 0)
      collecting (aref matrix n col-num) into cols
  finally (return cols)))

(defun positions-for-row (n arr)
  (mapcar (lambda (x) (list n x))
          (make-range (length arr))))

(defun positions-for-col (n arr)
  (mapcar (lambda (x) (list x n))
          (make-range (length arr))))

(defun max-positions (n matrix)
  (let ((arr (row n matrix)))
    (remove-if-not (lambda (x) (eq (nth (cadr x) arr) (max-array-value arr)))
                     (positions-for-row n arr))))

(defun min-positions (n matrix)
  (let ((arr (column n matrix)))
    (remove-if-not (lambda (x) (eq (nth (car x) arr) (min-array-value arr)))
                   (positions-for-col n arr))))

(defun max-row-positions(dim matrix)
  (mapcan (lambda (x) (max-positions x matrix))
          (make-range dim)))

(defun min-col-positions(dim matrix)
  (mapcan (lambda (x) (min-positions x matrix))
          (make-range dim)))

(defun max-array-value (arr)
  (apply #'max arr))

(defun min-array-value (arr)
  (apply #'min arr))

(defun increment-point (pt)
  (cons (1+ (car pt)) (cons (1+ (cadr pt)) '())))

(defun increment-points-for-display (sadd-pts)
  (cond ((null sadd-pts) nil)
         ((numberp (caar sadd-pts))
          (cons (increment-point (car sadd-pts))
                (increment-points-for-display (cdr sadd-pts))))))

(defun rows-in-matrix (matrix)
  (let ((dims (array-dimensions matrix)))
    (if (eq 2 (length dims))
      (car dims)
      0)))

(defun columns-in-matrix (matrix)
  (let ((dims (array-dimensions matrix)))
    (if (eq 2 (length dims))
       (cadr dims)
       0)))

(defun saddle-points (matrix)
  (if (some (lambda (x) (= x 0)) (array-dimensions matrix))
    ()
    (let* ((row-count (rows-in-matrix matrix))
           (column-count (columns-in-matrix matrix))
           (maxes (max-row-positions row-count matrix))
           (mins (min-col-positions column-count matrix)))
      (increment-points-for-display
        (intersection maxes mins :test 'equal)))))


