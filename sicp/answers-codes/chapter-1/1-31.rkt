; Exercise 1.31
;

#lang racket

(define (product-recur term a next b)
  (if (> a b)
      1
      (* (term a) (product-recur term (next a) next b))))



(define (product-iter term a next b)
  (define (iter mul a)
    (if (> a b)
        mul
        (iter (* mul (term a)) (next a))))
  (iter 1 a))





; test
(define (term x)
  (* (/ (- x 1) x) (/ (+ x 1) x)))

(define (next x)
  (+ x 2))

(product-recur term 3 next 100)
(product-iter term 3 next 100)
