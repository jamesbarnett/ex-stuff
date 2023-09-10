(defpackage :pal-picker
  (:use :cl)
  (:export :pal-picker :habitat-fitter :feeding-time-p
           :pet :play-fetch))

(in-package :pal-picker)

(defun between (n low high)
  (and (<= low n) (>= high n)))

(defun pal-picker (personality)
  (case personality
    (:lazy "Cat")
    (:energetic "Dog")
    (:quiet "Fish")
    (:hungry "Rabbit")
    (:talkative "Bird")
    (otherwise "I don't know... A dragon?")))

(defun habitat-fitter (weight)
  (cond ((>= weight 40) :massive)
        ((between weight 20 39) :large)
        ((between weight 10 19) :medium)
        ((between weight 1 9) :small)
        ((<= weight 0) :just-your-imagination)))

(defun feeding-time-p (fullness)
  (cond ((> fullness 20) "All is well.")
        (t "It's feeding time!")))

(defun pet (pet)
  (cond ((string= pet "Fish") "Maybe not with this pet...")
        (t nil)))

(defun play-fetch (pet)
  (cond ((string= pet "Dog") nil)
        (t "Maybe not with this pet...")))
