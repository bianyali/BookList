; Exercise 1.33
;

#lang racket

(define (filtered-accumulate combiner filter null-value term a next b)
  (if (> a b)
      null-value
      (if (filter a)
          (combiner (term a) (filterd-accumulate combiner filter null-value term (next a) next b))
          (filtered-accumulate combiner filter null-value term (next a) next b))))
