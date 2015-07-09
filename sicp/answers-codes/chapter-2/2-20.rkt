; Exercise 2.20
; same-parity
;

#lang racket

(define (same-parity x . y)
  (define (recur pre args)
    (cond ((null? args) null)
          ((even-odd x (car args)) (cons (car args) (recur pre (cdr args))))
          (else (recur pre (cdr args)))))
  (cons x (recur x y)))

(define (even-odd x y)
  (= (- (remainder x 2)
        (remainder y 2))
     0))



; test
; (even-odd 1 2)
; (even-odd 2 1)
; (even-odd 1 1)


; test
(same-parity 1 2 3 4 5 6 7)
(same-parity 2 3 4 5 6 7 8)
