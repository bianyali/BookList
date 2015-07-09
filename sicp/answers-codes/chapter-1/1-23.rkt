; Exercise 1.23
;

#lang racket

;;; prime?
(define (prime? n)
  (= n (smallest-divisor n)))

(define (smallest-divisor n)
  (if (divides? 2 n)
      2
      (find-divisor n 3)))

(define (find-divisor n test-divisor)
  (cond ((> (* test-divisor test-divisor) n) n)
         ((divides? test-divisor n) test-divisor)
         (else (find-divisor n (+ test-divisor 2)))))

(define (divides? test-divisor n)
  (= (remainder n test-divisor) 0))



;;; timed-prime-test
(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (current-inexact-milliseconds)))

(define (start-prime-test n start-time)
  (when (prime? n)
    (report-prime (- (current-inexact-milliseconds) start-time))))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time))

;;; run-test
(timed-prime-test 1009)
(timed-prime-test 1013)
(timed-prime-test 1019)


(timed-prime-test 10007)
(timed-prime-test 10009)
(timed-prime-test 10037)


(timed-prime-test 100003)
(timed-prime-test 100019)
(timed-prime-test 100043)


(timed-prime-test 1000003)
(timed-prime-test 1000033)
(timed-prime-test 1000037)
