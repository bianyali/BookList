; Exercise 1.38
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

(define (e k)
  (define (N i)
    1)
  (define (D i)
    (if (= 0 (remainder (+ i 1) 3))
        (* 2 (/ (+ i 1) 3))
        1))
  (+ 2.0
     (cont-frac-iter N D k)))

(e 1)
(e 2)
(e 3)
