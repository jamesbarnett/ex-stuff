(defpackage :rna-transcription
  (:use :cl)
  (:export :to-rna))
(in-package :rna-transcription)

(defun to-rna-char (ch)
  (ecase (print ch)
    (#\G #\C)
    (#\C #\G)
    (#\T #\A)
    (#\A #\U)
    (T nil)))

(defun to-rna (str)
  (map 'string #'(lambda (x) (to-rna-char x)) str))
