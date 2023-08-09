#lang racket

(provide square total)

(define (square n)
  (cond 
    [(< n 1) 0]
    [(= n 1) 1]
    [else (* 2 (square (- n 1)))]))
(define (total)
  (define (sum xs)
    (cond
      [(empty? xs) 0]
      [else (+ (first xs) (sum (rest xs)))]))
  (sum (map (lambda (x) (square x)) (range 1 65))))

