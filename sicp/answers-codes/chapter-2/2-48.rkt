; Exercise 2.48
; implementation for frames

#lang racket

(define (make-vect x y)
  (cons x y))

(define (xcor-vect v)
  (car v))

(define (ycor-vect v)
  (cdr v))

(define (scale-vect s v)
  (make-vect (* s (xcor-vect v)) (* s (ycor-vect v))))

(define (make-segment v1 v2)
  (list v1 v2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cadr seg))



; test
(define seg (make-segment (make-vect 3 4) (make-vect 2 2)))
seg
(start-segment seg)
(end-segment seg)
