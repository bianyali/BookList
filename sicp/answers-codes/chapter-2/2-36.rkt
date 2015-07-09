; Exercise 2.36
; accumulate-n
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

; test
(define seqs '( (1 2 3) (4 5 6) (7 8 9) (10 11 12)))
(accumulate-n + 0 seqs)
