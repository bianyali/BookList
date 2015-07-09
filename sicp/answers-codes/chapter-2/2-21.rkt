; Exercise 2.21
; square-list
;

#lang racket

(define (square-list-base items)
  (if (null? items)
      null
      (cons (square (car items))
            (square-list-base (cdr items)))))

(define (square-list-map items)
  (map square items))

(define (square x)
  (* x x))

; test
(square-list-base (list 1 2 3 4))
(square-list-map (list 1 2 3 4))
