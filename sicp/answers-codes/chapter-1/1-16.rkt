; Exercise 1-16
; Design a procedure that evolves an iterative exponentiation process
; that uses successive squaring and uses a logarithmic number of steps,
; such as fast-expt

#lang racket

; a recursive procedure
(define (fast-expt-rec b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt-rec b (/ n 2))))
        (else (* b (fast-expt-rec b (- n 1))))))

; a iterative procedure
(define (fast-expt-iter b n)
  (if (= n 0)
      1
      (iter b n 1)))

(define (iter b n a)
  (cond ((= n 0) a)
        ((even? n) (iter (square b) (/ n 2) a))
        (else (iter b (- n 1) (* a b)))))


(define (square x)
  (* x x))
