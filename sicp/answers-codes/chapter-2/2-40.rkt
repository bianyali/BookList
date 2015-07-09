; Exercise 2.40
; unique-pairs
;

#lang racket


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (flatmap op seq)
  (accumulate append null
              (map op seq)))



(define (unique-pairs n)
  (accumulate append
              null
              (map (lambda (i)
                     (map (lambda (j)
                            (list i j))
                          (enumerate-interval 1 (- i 1))))
                   (enumerate-interval 1 n))))

(define (unique-pairs-test n)
  (flatmap (lambda (i)
             (map (lambda (j) (list j i))
                  (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (enumerate-interval m n)
  (cond ((> m n) null)
        ((= m n) (cons n null))
        ((< m n) (cons m (enumerate-interval (+ m 1) n)))))
; test

; (enumerate-interval 3 30)

(unique-pairs 3)
(unique-pairs-test 3)
