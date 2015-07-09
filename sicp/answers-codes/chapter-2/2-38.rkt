; Exercise 2.38
; fold-right and fold-left
;

#lang racket


(define (fold-right op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (fold-right op init (cdr sequence)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))



(fold-right / 1 (list 1 2 3))
; (/ 1 (/ 2 (/ 3 1)))
(fold-left / 1 (list 1 2 3))
; (/ (/ (/ 1 1) 2) 3)

(fold-right list null (list 1 2 3))
; (list 1 (list 2 (list 3 null)))
(fold-left list null (list 1 2 3))
; (list (list (list 1 null) 2) 3)

; commutative
