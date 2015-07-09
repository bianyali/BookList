; Exercise 2.22
; square-list evolves an iterative process
;

#lang racket


(define (square-list-1 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons (square (car things))
                    answer))))
  (iter items null))

(define (square-list-2 items)
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things)
              (cons answer
                    (square (car things))))))
  (iter items null))

(define (square x)
  (* x x))

; test

(square-list-1 (list 1 2 3 4 5 6))
(square-list-2 (list 1 2 3 4 5 6))

(define (square-list items)
  (define (list-append things atom)
    (if (null? things)
        (list atom)
        (cons (car things)
              (list-append (cdr things) atom))))
  (define (iter things answer)
    (if (null? things)
        answer
        (iter (cdr things) (list-append answer (square (car things))))))
  (iter items null))

(square-list (list 1 2 3 4 5 6))
