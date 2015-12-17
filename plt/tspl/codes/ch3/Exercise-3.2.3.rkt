; Exercise 3.2.3
;

#lang racket

(letrec ([even?
          (lambda (x)
            (or (= x 0)
                (odd? (- x 1))))]
         [odd?
          (lambda (x)
            (and (not (= x 0))
                 (even? (- x 1))))])
  (even? 20))



(let ([even?
          (lambda (x)
            (or (= x 0)
                (odd? (- x 1))))]
         [odd?
          (lambda (x)
            (and (not (= x 0))
                 (even? (- x 1))))])
  (even? 20))
