; Exercise 1.32
;

#lang racket

(define (accumulate-recur combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate-recur combiner null-value term (next a) next b))))


(define (accumulate-iter combiner null-value term a next b)
  (define (iter result a)
    (if (> a b)
        result
        (iter (combiner result (term a)) (next a))))
  (iter null-value a))


; test
(define (sum x y)
  (+ x y))

(define (product x y)
  (* x y))

(define (term x)
  (* x 2))

(define (next x)
  (+ x 1))

(accumulate-recur sum 0 term 0 next 10)
(accumulate-iter sum 0 term 0 next 10)

(accumulate-recur product 1 term 1 next 10)
(accumulate-iter product 1 term 1 next 10)
