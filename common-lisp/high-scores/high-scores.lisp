(defpackage :high-scores
  (:use :cl)
  (:export :make-high-scores-table :add-player
           :set-score :get-score :remove-player))

(in-package :high-scores)

(defun make-high-scores-table ()
  (make-hash-table))

(defun add-player (hash-table player)
  (setf (gethash player hash-table) 0))

(defun set-score (hash-table player score)
  (setf (gethash player hash-table) score))

(defun get-score (hash-table player)
  (if (gethash player hash-table)
    (gethash player hash-table)
    0))

(defun remove-player (hash-table player)
  (remhash player hash-table))

