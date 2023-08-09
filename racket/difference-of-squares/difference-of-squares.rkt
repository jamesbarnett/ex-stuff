#lang racket

(provide sum-of-squares square-of-sum difference)

(define (sum xs)
  (cond
    [(empty? xs) 0]
    [else (+ (first xs) (sum (rest xs)))]))

(define (square x)
  (* x x))

(define (sum-of-squares number)
  (sum (map (lambda (x) (square x)) (inclusive-range 1 number))))

(define (square-of-sum number)
  (square (sum (inclusive-range 1 number))))

(define (difference number)
  (- (square-of-sum number) (sum-of-squares number)))

