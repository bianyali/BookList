; Exercise 2.1
;

#lang racket

(define (make-rat n d)
  (if (> (* n d) 0)
      (if (> n 0)
          (cons n d)
          (cons (- n) (- d)))
      (if (> n 0)
          (cons (- n) (- d))
          (cons n d))))

(make-rat 1 2)
(make-rat -1 2)
(make-rat 1 -2)
(make-rat -1 -2)
