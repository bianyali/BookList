; Exercise 2.28
; fringe
;

#lang racket

(define (fringe tree)
  (define (recur node pre)
    (if (pair? node)
        (recur (cdr node)
                   (recur (car node) pre))
        (if (null? node)
            pre
            (if (null? pre)
                (cons node null)
                (add-list pre node)))))
  (recur tree '()))

(define (add-list list-tmp x)
  (if (null? list-tmp)
      (list x)
      (cons (car list-tmp)
            (add-list (cdr list-tmp) x))))

; test
(define x (list (list 1 2) (list 3 4)))
(fringe (list 1 2 3))
(fringe (list (list 1 2) (list 3 4)))
(fringe (list (list 1 2) 3 4 (list 3 4)))
; a(fringe x)
;(fringe (list x x))
