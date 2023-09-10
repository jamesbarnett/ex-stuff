(defpackage :leap
  (:use :cl)
  (:export :leap-year-p))
(in-package :leap)

(defun leap-year-p (year)
  (and (eq (mod year 4) 0)
       (or (not (eq (mod year 100) 0)) (eq (mod year 400) 0))))
