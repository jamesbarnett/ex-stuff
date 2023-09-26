(defpackage :raindrops
  (:use :cl)
  (:export :convert))

(in-package :raindrops)

(defun convert (n)
  "Converts a number to a string of raindrop sounds."
  (let ((mod3 (eq (mod n 3) 0))
	(mod5 (eq (mod n 5) 0))
	(mod7 (eq (mod n 7) 0)))
    (cond ((and mod3 mod5 mod7)
	  "PlingPlangPlong")
	  ((and mod3 mod5)
	   "PlingPlang")
	  ((and mod5 mod7)
	   "PlangPlong")
	  ((and mod3 mod7)
	   "PlingPlong")
	  (mod3 "Pling")
	  (mod5 "Plang")
	  (mod7 "Plong")
	  (t (format nil "~s" n)))))

