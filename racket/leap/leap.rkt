#lang racket

(provide leap-year?)

(define (leap-year? year)
  (and (eq? (modulo year 4) 0)
       (or (not (eq? (modulo year 100) 0))
           (eq? (modulo year 400) 0))))
