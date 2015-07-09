; Exercise 2.62
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


(define (intersection-set set1 set2)
  (if (or (null? set1) (null? set2))
      null
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2) (cons (car set1) (intersection-set (cdr set1) (cdr set2))))
              ((< x1 x2) (intersection-set (cdr set1) set2))
              ((> x1 x2) (intersection-set set1 (cdr set2)))))))


(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((= x1 x2) (cons x1 (union-set (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-set (cdr set1) set2)))
                      ((> x1 x2) (cons x2 (union-set set1 (cdr set2)))))))))


; test
(define set1 (list 1 2 3 4 5))
(define set2 (list 3 4 5 6 7))

(intersection-set set1 set2)
(union-set set1 set2)
