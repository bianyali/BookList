; Exercise 2.39
; reverse
;

#lang racket


(define (fold-right op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (fold-right op init (cdr sequence)))))

(define (fold-left op init seq)
  (define (iter result rest)
    (if (null? rest)
        result
        (iter (op result (car rest))
              (cdr rest))))
  (iter init seq))


(define (reverse-right seq)
  (fold-right (lambda (x y)
                (if (null? y)
                    (cons x null)
                    (append y (cons x null))
                    ))
              null
              seq))

(define (reverse-left seq)
  (fold-left (lambda (x y)
               (cons y x))
             null
             seq))

; test
(define seq '(1 2 3 4 5))
(reverse-right seq)
(reverse-left seq)
