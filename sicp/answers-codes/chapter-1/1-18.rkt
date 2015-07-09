; Exerices 1.18
; Devise a procedure trhat generate an iterative process
; for multiplying two intergers interms of adding, doubling,
; and halving and uses a logarithmic number of steps.

#lang racket

(define (mul-iter a b)
  (iter a b 0))

(define (iter a b c)
  (cond ((= b 0) c)
        ((even? b) (iter (* 2 a) (/ b 2) c))
        (else (iter a (- b 1) (+ c a)))))
