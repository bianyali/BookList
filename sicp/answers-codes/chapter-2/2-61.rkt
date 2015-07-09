; Exercise 2.61
; adjoin-set using the ordered representation
;

#lang racket

(define (element-of-set? item set)
  (cond ((null? set) #f)
        ((< item (car set)) #f)
        ((= item (car set)) #t)
        (else (element-of-set? item (cdr set)))))


(define (adjoin-set item set)
  (cond ((null? set) (cons item null))
        ((< item (car set)) (cons item set))
        ((= item (car set)) set)
        (else (cons (car set) (adjoin-set item (cdr set))))))


; test
(define set (list 3 4 5 6 7))

(element-of-set? 1 set)
(element-of-set? 8 set)
(element-of-set? 5 set)

(adjoin-set 1 set)
(adjoin-set 8 set)
(adjoin-set 3 set)
