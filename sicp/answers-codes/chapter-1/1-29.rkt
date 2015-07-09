; Exercise 1.29
;

#lang racket

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
         (sum term (next a) next b))))

(define (simpson f a b n)
  (define h (/ (- b a) n))
  (define (next x)
    (+ (* 2 h) x))
  (* (+ (* 2 (sum f (+ a h) next b)) (sum f (+ a (* 2 h)) next b) a) (/ (* 2 h) 3)))


(define (cube x)
  (* x x x))

(simpson cube 0 1 100)
(simpson cube 0 1 1000)