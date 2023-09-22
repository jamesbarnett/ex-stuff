(defpackage :reporting-for-duty
  (:use :cl)
  (:export :format-quarter-value :format-two-quarters
           :format-two-quarters-for-reading))

(in-package :reporting-for-duty)

(defun format-quarter-value (label value)
  (format nil "The value ~d quarter: ~:@(~a~)" label value))

(defun format-two-quarters (stream name1 val1 name2 val2)
  (format stream "~%~a~&~a~%" (format-quarter-value name1 val1)
          (format-quarter-value name2 val2)))

(defun format-two-quarters-for-reading (stream name1 val1 name2 val2)
  (format stream "~S" (list (format-quarter-value name1 val1)
          (format-quarter-value name2 val2))))
