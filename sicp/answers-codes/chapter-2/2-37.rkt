; Exercise 2.37
; vector and matrix
;

#lang racket


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))


(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      null
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (sub-m)
         (dot-product sub-m v))
       m))

(define (transpose mat)
  (accumulate-n cons null mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (vec)
           (matrix-*-vector n vec)) m)))

; test
(define mat '((1 2 3 4) (4 5 6 6) (6 7 8 9)))
(define v '(1 2 3 4))

(dot-product v v)
(matrix-*-vector mat v)
(transpose mat)

(matrix-*-matrix mat mat)
