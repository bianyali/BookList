; Exercise 1.10
;

#lang racket

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))


(define (f n)
  (A 0 n))
; (f 1) : 2
; (f 2) : 4
; (f 3) : 6
; (f n) : 2n



(define (g n)
  (A 1 n))
; (g 1) : 2
; (g 2) : 4
; (g 3) : 8
; (g 4) : 16
; (g n) : (expt 2 n)


(define (h n)
  (A 2 n))
; (h 1) : 2
; (h 2) : 4
; (h 3) : 16
; (h 4) : 65536
; (h n) : (expt 2 (h (- n 1)))
