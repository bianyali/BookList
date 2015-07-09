; Exercise 2.59
; Sets as unordered lists
;

#lang racket


(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((equal? x (car set)) #t)
        (else (element-of-set? x (cdr set)))))

(define (adjoin-set x set)
  (if (element-of-set? x set)
      set
      (cons x set)))

(define (intersection-set set1 set2)
  (cond ((or (null? set1) (null? set2)) null)
        ((element-of-set? (car set1) set2) (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2) (union-set (cdr set1) set2))
        (else (union-set (cdr set1) (cons (car set1) set2)))))


; test
(define set (list 1 2 3 4))
(define set1 (list 1 2 3 4 5))
(define set2 (list 3 4 5 6 7))

(element-of-set? 1 set)
(element-of-set? 5 set)
(adjoin-set 1 set)
(adjoin-set 5 set)
(intersection-set set1 set2)
(union-set set1 set2)
