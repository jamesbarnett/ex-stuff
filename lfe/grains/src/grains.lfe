(defmodule grains
  (export (square 1) (total 0)))

(defun square (n)
  (cond
    ((< n 1) 0)
    ((== n 1) 1)
    ('true (* 2 (square (- n 1))))))


(defun total ()
  (lists:sum
    (lists:map
      (lambda (x) (square x))
      (lists:seq 1 64))))

