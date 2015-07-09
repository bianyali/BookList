; Exercise 2.26
;

#lang racket

(define x (list 1 2 3))

(define y (list 4 5 6))

(append x y)
(cons 1 (cons 2 (cons 3 (cons 4 (cons 5 (cons 6 null))))))

(cons x y)
(cons (cons 1 (cons 2 (cons 3 null)))
      (cons 4 (cons 5 (cons 6 null))))

(list x y)
(cons (cons 1 (cons 2 (cons 3 null)))
      (cons (cons 4 (cons 5 (cons 6 null)))
            null))
