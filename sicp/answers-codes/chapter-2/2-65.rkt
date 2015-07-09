; Exercise 2.65
; balanced tree: union-set / intersection-set

#lang racket

(define (entry tree)
  (car tree))

(define (left-branch tree)
  (cadr tree))

(define (right-branch tree)
  (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
        ((= x (entry set)) #t)
        ((< x (entry set)) (element-of-set? x (left-branch set)))
        ((> x (entry set)) (element-of-set? x (right-branch set)))))


(define (tree->list tree)
  (if (null? tree)
      null
      (append (tree->list (cadr tree))
              (cons (entry tree)
                    (tree->list (right-branch tree))))))


(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons null elts)
      (let ((left-size (quotient (- n 1) 2)))
        (let ((left-result (partial-tree elts left-size)))
          (let ((left-tree (car left-result))
                (non-left-elts (cdr left-result))
                (right-size (- n (+ left-size 1))))
            ; (display left-tree)
            (let ((this-entry (car non-left-elts))
                  (right-result (partial-tree (cdr non-left-elts) right-size)))
              (let ((right-tree (car right-result))
                    (remaining-elts (cdr right-result)))
                (cons (make-tree this-entry
                                 left-tree
                                 right-tree)
                      remaining-elts))))))))


(define (intersection-list set1 set2)
  (if (or (null? set1) (null? set2))
      null
      (let ((x1 (car set1))
            (x2 (car set2)))
        (cond ((= x1 x2) (cons (car set1) (intersection-list (cdr set1) (cdr set2))))
              ((< x1 x2) (intersection-list (cdr set1) set2))
              ((> x1 x2) (intersection-list set1 (cdr set2)))))))


(define (union-list set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else (let ((x1 (car set1)) (x2 (car set2)))
                (cond ((= x1 x2) (cons x1 (union-list (cdr set1) (cdr set2))))
                      ((< x1 x2) (cons x1 (union-list (cdr set1) set2)))
                      ((> x1 x2) (cons x2 (union-list set1 (cdr set2)))))))))


(define (union-set set1 set2)
  (list->tree (union-list (tree->list set1) (tree->list set2))))

(define (intersection-set set1 set2)
  (list->tree (intersection-list (tree->list set1) (tree->list set2))))


; test
(define set1 (list->tree (list 1 2 3 4 5)))
(define set2 (list->tree (list 3 4 5 6 7)))

;(tree->list set1)
;(tree->list set2)

;(union-list (tree->list set1) (tree->list set2))

(union-set set1 set2)
(intersection-set set1 set2)
