; Exercise 2.34:
; horner-eval
;

#lang racket


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))


(define (horner-eval x coefficient-sequence)
  (accumulate (lambda (this-coeff higher-terms)
                (+ this-coeff (* x higher-terms)))
              0
              coefficient-sequence))


; test
(define coef-sq (list 1 2 3))

(horner-eval 1 coef-sq)
(horner-eval 2 coef-sq)
(horner-eval 2 (list 1 3 0 5 0 1))
