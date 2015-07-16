; Exercise 2.8.1

; swtiched tree-copy

#lang racket

(define tree-copy (lambda (tr)
                    (if (not (pair? tr))
                        tr
                        (cons (tree-copy (car tr))
                              (tree-copy (cdr tr))))))

(define tree-copy-switched (lambda (tr)
                    (if (not (pair? tr))
                        tr
                        (cons (tree-copy-switched (cdr tr))
                              (tree-copy-switched (car tr))))))

(define tr '(1 (2 3 . 4) (5 6 . 7)))

(tree-copy tr)
(tree-copy-switched tr)
