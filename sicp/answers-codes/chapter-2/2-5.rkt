; Exercise 2.5
;

#lang racket

(define (cons a b)
  (* (expt 2 a)
     (expt 3 b)))

(define (car p)
  (if (not (= (remainder p 2) 0))
      0
      (+ (car (/ p 2)) 1)))

(define (cdr p)
  (if (not (= (remainder p 3) 0))
      0
      (+ (cdr (/ p 3)) 1)))

(cons 1 2)
(car (cons 1 2))
(cdr (cons 1 2))
