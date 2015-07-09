; Exercise 2.35
; count-leaves
;

#lang racket


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))


(define (count-leaves t)
  (accumulate +
              0
              (map (lambda (sub-tree)
                     (if (pair? sub-tree)
                         (count-leaves sub-tree)
                         1))
                   t)))

;test
(count-leaves (list (list 1 2) (list 3 4)))
(count-leaves (cons (list 1 2) (list 3 4)))
(count-leaves (cons (cons (list 1 2) (list 3 4))
                    (cons (list 1 2) (list 3 4))))
