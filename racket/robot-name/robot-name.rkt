#lang racket

(provide make-robot
         name
         reset!
         reset-name-cache!)

(struct robot (name))
(define robots (make-hash))

(define (random-letter)
  (integer->char (+ (char->integer #\A)
                    (random 26))))

(define (random-digit)
  (integer->char (+ (char->integer #\0) 
                    (random 10))))

(define (alpha-component)
  (list (random-letter) (random-letter)))

(define (numeric-component)
  (list (random-digit) (random-digit) (random-digit)))

(define (name-candidate)
  (append (alpha-component) (numeric-component)))

(define (make-robot)
  (let ((made-robot (robot (list->string (name-candidate)))))
    (cond ((hash-has-key? robots (robot-name made-robot)) (make-robot))
          (else (hash-set! robots (robot-name made-robot) made-robot)))
    made-robot))

(define (name robot)
  (robot-name robot))

(define (reset! robot)
  (hash-remove! robots (robot-name robot))
  (make-robot))

(define (reset-name-cache!)
  (hash-clear! robots))
