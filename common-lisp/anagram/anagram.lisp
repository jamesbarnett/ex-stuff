(defpackage :anagram
  (:use :cl)
  (:export :anagrams-for))

(in-package :anagram)

(defun normalize (word)
  (sort (string-upcase word) #'char-lessp))

(defun anagrams-p (word candidate)
  (and (not (equal (string-downcase word) (string-downcase candidate)))
       (equal (normalize word) (normalize candidate))))

(defun anagrams-for (subject candidates)
  "Returns a sublist of candidates which are anagrams of the subject."
  (remove-if-not (lambda (x) (anagrams-p subject x)) candidates))
