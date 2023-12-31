;; Ensures that saddle-points.lisp and the testing library are always loaded
(eval-when (:compile-toplevel :load-toplevel :execute)
  (load "saddle-points")
  (quicklisp-client:quickload :fiveam))

;; Defines the testing package with symbols from saddle-points and FiveAM in scope
;; The `run-tests` function is exported for use by both the user and test-runner
(defpackage :saddle-points-test
  (:use :cl :fiveam)
  (:export :run-tests))

;; Enter the testing package
(in-package :saddle-points-test)

(setf fiveam:*on-failure* :backtrace)
(setf fiveam:*on-error* :debug)

;; Define and enter a new FiveAM test-suite
(def-suite* saddle-points-suite)

(defun equal-coordinates (alist-one alist-two)
  (and (subsetp alist-one alist-two :test 'equal)
       (subsetp alist-two alist-one :test 'equal)))

; (test can-adjust-to-stupid-1-based-shit
;   (is (equal '((1 2) (2 2) (2 3) (3 2)) (saddle-points:increment-points-for-display
;                                           '((0 1) (1 1) (1 2) (2 1))))))
;
; (test can-extract-matrix-rows-and-cols
;     (let ((matrix #2A((9 8 7)
;                       (6 6 2)
;                       (3 6 4))))
;       (is (equalp '(6 6 2) (saddle-points:row 1 matrix)))
;       (is (equalp '(9 8 7) (saddle-points:row 0 matrix)))
;       (is (equalp '(3 6 4) (saddle-points:row 2 matrix)))
;       (is (equalp '(9 6 3) (saddle-points:column 0 matrix)))
;       (is (equalp '(8 6 6) (saddle-points:column 1 matrix)))
;       (is (equalp '(7 2 4) (saddle-points:column 2 matrix)))))
; (test can-extract-tall-matrix-rows-and-cols
;     (let ((matrix #2A((9 8)
;                       (6 6)
;                       (3 6))))
;       (is (equalp '(6 6) (saddle-points:row 1 matrix)))
;       (is (equalp '(9 8) (saddle-points:row 0 matrix)))
;       (is (equalp '(3 6) (saddle-points:row 2 matrix)))
;       (is (equalp '(9 6 3) (saddle-points:column 0 matrix)))
;       (is (equalp '(8 6 6) (saddle-points:column 1 matrix)))))

; (test can-find-max-in-a-given-row
;     (let* ((matrix #2A((5 8 7)
;                       (6 6 2)
;                       (3 6 4)))
;            (row-one (saddle-points:row 0 matrix))
;            (col-one (saddle-points:column 0 matrix))
;            (row-two (saddle-points:row 1 matrix)))
;       (is (equalp '((0 1)) (saddle-points:max-positions 0 row-one)))
;       (is (equalp '((2 0)) (saddle-points:min-positions 0 col-one)))
;       (is (equalp '((1 0) (1 1)) (saddle-points:max-positions 1 row-two)))))
;
; (test can-find-max-row-and-min-col-positions
;     (let ((matrix #2A((5 8 7)
;                       (6 6 2)
;                       (3 6 4))))
;         (is (equalp '((0 1) (1 0) (1 1) (2 1))
;                     (saddle-points:max-row-positions matrix)))
;         (is (equalp '((2 0) (1 1) (2 1) (1 2))
;                     (saddle-points:min-col-positions matrix)))))
(test can-identify-single-saddle-point
    (let ((matrix #2A((9 8 7)
                      (5 3 2)
                      (6 6 7)))
          (result '((2 1))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))


(test can-identify-that-empty-matrix-has-no-saddle-points
    (let ((matrix #2A(()))
          (result '()))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-lack-of-saddle-points-when-there-are-none
    (let ((matrix #2A((1 2 3)
                    (3 1 2)
                      (2 3 1)))
          (result '()))
      (is (equal-coordinates result (print (saddle-points:saddle-points matrix))))))

(test can-identify-multiple-saddle-points-in-a-column
    (let ((matrix #2A((4 5 4)
                      (3 5 5)
                      (1 5 4)))
          (result '((1 2) (2 2) (3 2))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-multiple-saddle-points-in-a-row
    (let ((matrix #2A((6 7 8)
                      (5 5 5)
                      (7 5 6)))
          (result '((2 1) (2 2) (2 3))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-saddle-point-in-bottom-right-corner
    (let ((matrix #2A((8 7 9)
                      (6 7 6)
                      (3 2 5)))
          (result '((3 3))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-saddle-points-in-a-non-square-matrix
    (let ((matrix #2A((3 1 3)
                      (3 2 4)))
          (result '((1 3) (1 1))))
          (format nil "~%~%Matrix (non-square): ~a~%~%" (array-dimensions matrix))
        ; (max-positions 1
        ; (min-positions
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-that-saddle-points-in-a-single-column-matrix-are-those-with-the-minimum-value
    (let ((matrix #2A((2)
                      (1)
                      (4)
                      (1)))
          (result '((2 1) (4 1))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(test can-identify-that-saddle-points-in-a-single-row-matrix-are-those-with-the-maximum-value
    (let ((matrix #2A((2 5 3 5)))
          (result '((1 2) (1 4))))
      (is (equal-coordinates result (saddle-points:saddle-points matrix)))))

(defun run-tests (&optional (test-or-suite 'saddle-points-suite))
  "Provides human readable results of test run. Default to entire suite."
  (run! test-or-suite))

(saddle-points-test:run-tests)
