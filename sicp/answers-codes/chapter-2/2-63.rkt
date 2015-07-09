; Exercise 2.63
; tree->list

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


(define (tree->list-1 tree)
  (if (null? tree)
      null
      (append (tree->list-1 (cadr tree))
              (cons (entry tree)
                    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree) result-list)))))
  (copy-to-list tree null))


; tree->list-2 produce the same result for every tree.
; tree->list-1 produce the same result for every tree.

; test
(define tree '(5 (3 (1 () (2 () ())) (4 () ())) (8 (7 (6 () ()) ()) ())))

(tree->list-1 tree)
(tree->list-2 tree)
