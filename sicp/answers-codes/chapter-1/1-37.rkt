; Exercise 1.37
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

(define (golden-ratio-recur k)
  (+ 1
     (cont-frac-recur (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(define (golden-ratio-iter k)
  (+ 1
     (cont-frac-iter (lambda (i) 1.0)
                (lambda (i) 1.0)
                k)))

(golden-ratio-recur 1)
(golden-ratio-recur 10)
(golden-ratio-recur 11)

(golden-ratio-iter 1)
(golden-ratio-iter 10)
(golden-ratio-iter 11)
