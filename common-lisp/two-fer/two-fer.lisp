(defpackage :two-fer
  (:use :cl)
  (:export :twofer))
(in-package :two-fer)

(defun twofer (&optional (name "you" name-p))
  (format nil "One for ~A, one for me."
          (if (and name-p name) name "you")))
