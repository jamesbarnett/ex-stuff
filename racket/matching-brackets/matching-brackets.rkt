#lang racket

(provide balanced?)

(define (check-expected? c stack)
  (if (empty? stack) #f (equal? c (car stack))))

(define (check-balanced? str stack)
  (cond
    ((empty? str) (empty? stack))
    ((equal? #\[ (car str))
     (check-balanced? (cdr str) (cons (car str) stack)))
    ((equal? #\{ (car str))
     (check-balanced? (cdr str) (cons (car str) stack)))
    ((equal? #\( (car str))
     (check-balanced? (cdr str) (cons (car str) stack)))

    ((equal? #\) (car str)) 
      (if (check-expected? #\( stack) 
          (check-balanced? (cdr str) (cdr stack))
          #f))
    ((equal? #\] (car str))
      (if (check-expected? #\[ stack)
          (check-balanced? (cdr str) (cdr stack))
          #f))
    ((equal? #\} (car str))
      (if (check-expected? #\{ stack)
          (check-balanced? (cdr str) (cdr stack))
          #f))
    (else (check-balanced? (cdr str) stack))))

(define (balanced? str)
  (check-balanced? (string->list str) '()))
  
