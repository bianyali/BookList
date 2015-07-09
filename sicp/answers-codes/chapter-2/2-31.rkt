; Exercise 2.31
; tree-map

#lang racket

(define (tree-map fun tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
               (tree-map fun sub-tree)
               (fun sub-tree)))
         tree))

(define (tree-map-fun fun)
  (lambda (tree)
    (map (lambda (sub-tree)
           (if (pair? sub-tree)
               (tree-map fun sub-tree)
               (fun sub-tree)))
         tree)))


(define (square x)
  (* x x))

; test
(define tree (list 1
                   (list 2 (list 3 4) 5)
                   (list 6 7)))

(define (square-tree tree)
  (tree-map square tree))

(square-tree tree)
((tree-map-fun square) tree)
