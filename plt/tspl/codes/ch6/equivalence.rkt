; Section 6.2. Generic Equivalence and Type Predicates

#lang racket

(define x 12)
(define y 12)

(eq? x y)


(eq? 3.4 (+ 3.0 0.4))

(eq? 9/2 9/2)

(let ([x (* 123455532452342 2)])
  (eq? x x))

(eq? null '())
