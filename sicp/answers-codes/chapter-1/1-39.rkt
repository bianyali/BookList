; Exercise 1.39
;

#lang racket

(define (cont-frac-recur N D K)
  (define (recur i)
    (if (= K i)
        (/ (N K) (D K))
        (/ (N i)
           (+ (D i) (recur (+ i 1))))))
  (recur 1))

(define (cont-frac-iter N D K)
  (define (iter i result)
    (if (= i 0)
        result
        (iter (- i 1)
              (/ (N i)
                 (+ (D i) result)))))
  (iter (- K 1)
        (/ (N K) (D K))))

(define (square x)
  (* x x))

(define (tan-cf x k)
  (define (N i)
    (if (= i 1)
        x
        (- (square x))))

  (define (D i)
    (- (* i 2) 1))

  (exact->inexact
     (cont-frac-iter N D k)))

(tan-cf 10 100)
