; Exercise 2.33
; list-maniplacation

#lang racket

(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))


(define (map-tmp p sequence)
  (accumulate (lambda (x y)
                (cons (p x) y))
              null
              sequence))

(define (append-tmp sq1 sq2)
  (accumulate cons sq2 sq1))

(define (length-tmp sequence)
  (accumulate (lambda (x y)
                (+ x 1))
              0 sequence))


;test
(define sq (list 1 2 3 4))
(define sq1 (list 1 2 3 4))
(define sq2 (list 5 6 7 8 9))

(define (square x)
  (* x x))

(map-tmp square sq)
(append-tmp sq1 sq2)
(length sq)
