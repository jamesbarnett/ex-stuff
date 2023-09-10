(defpackage :character-study
  (:use :cl)
  (:export
   :compare-chars
   :size-of-char
   :change-size-of-char
   :type-of-char))
(in-package :character-study)

(defun compare-chars (char1 char2)
  (cond ((char-lessp char1 char2) :less-than)
        ((char-greaterp char1 char2) :greater-than)
        (t :equal-to)))

(defun size-of-char (char)
  (cond ((upper-case-p char) :big)
        ((lower-case-p char) :small)
        (t :no-size)))

(defun change-size-of-char (char wanted-size)
  (case wanted-size
    (:small (char-downcase char))
    (:big (char-upcase char))
    (t char)))

(defun type-of-char (char)
  (cond ((alpha-char-p char) :alpha)
        ((digit-char-p char) :numeric)
        ((char= char #\Space) :space)
        ((char= char #\Newline) :newline)
        (t :unknown)))

