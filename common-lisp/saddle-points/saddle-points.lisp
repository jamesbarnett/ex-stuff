(defpackage :saddle-points
  (:use :cl)
  (:export :saddle-points
           :make-range
           :row
           :column
           :max-row-position
           :min-col-position
           :max-row-positions
           :min-col-positions))

(in-package :saddle-points)

(defun make-range (n)
  (loop for num from 0 to (- n 1) collect num))

(defun row (row-num matrix)
  (loop for n upto (1- (array-dimension matrix 0))
      collecting (aref matrix row-num n) into rows
  finally (return rows)))

(defun column (col-num matrix)
  (loop for i upto (-1 (array-dimension matrix 1))
      collecting (aref matrix col-num i) into cols
  finally (return cols)))

; (defun ivp (arr)
;    (loop
;      for x in arr
(defun max-position (arr)
  (if (null arr)
      nil  ; Handle empty array as a special case
      (loop for i from 0
            for element in arr
            for max-element = (car arr) ; Initialize max-element with the first element
            for max-index = 0           ; Initialize max-index with 0
            when (> element max-element)
            do (setq max-element element
                     max-index i)
            finally (return max-index))))

(defun pair-indices-and-values (arr)
  (defun expand-if-cons (n arr)
    (if (consp (nth n (print arr)))
      (append (cons x (car (nth n arr))) (cons n (cadr (nth n arr))))
      (list  n (nth n arr))))
  (mapcar #'(lambda (n) (expand-if-cons n arr))
       (make-range (length arr))))

(defun max-array-value (arr)
  (apply #'max arr))

(defun min-array-value (arr)
  (apply #'min arr))

(defun indices-of-value (n arr)
  (remove-if #'(lambda (x) (not (equal (cadr x) n)))
             (pair-indices-and-values arr)))

(defun indices-of-max-values (arr)
  (indices-of-value (max-array-value arr) arr))

(defun indices-of-min-values (arr)
  (indices-of-value (min-array-value arr) arr))

(defun max-row-position (row-num row-data)
  (let* ((column-indices-of-max-value (indices-of-max-values row-data))
         (full-indices (mapcar
                            #'(lambda (x)
                                (list (1+ row-num) (1+ (car x))))
                            (print column-indices-of-max-value))))
    (mapcar #'car full-indices)))

(defun min-col-position (col-num col-data)
  (let* ((row-indices-of-min-value (indices-of-min-values col-data))
         (full-indices (mapcar
                            #'(lambda (x)
                                (list (1+ (car x)) (1+ col-num)))
                            row-indices-of-min-value)))
        (mapcar #'car full-indices)))

(defun max-row-positions (matrix)
  (mapcar
       #'(lambda (n)
          (max-row-position n (row n matrix)))
       (make-range (array-dimension matrix 0))))

(defun min-col-positions (matrix)
  (mapcar
       #'(lambda (n)
         (min-col-position n (column n matrix)))
       (make-range (array-dimension matrix 1))))

; (defun is-col-min (coordinates matrix)
;   (let (l

; (defun saddle-points (matrix)
;   (let ((maxes (max-row-positions matrix)))
;     (remove-if-not #'(lambda (x) (is-col-min x matrix)) maxes)))

(defun saddle-points (matrix)
  (let ((maxes (max-row-positions matrix))
        (mins (min-col-positions matrix)))
    (intersection maxes mins :test 'equal)))
    ; (intersection (max-row-positions matrix)
    ;               (min-col-positions matrix) :test 'equalp)))

