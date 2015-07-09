; Exercise 1.24
;

#lang racket

;;; prime?
(define (prime? n)
  (fast-prime? n 10))

; fast-prime?
(define (fast-prime? n times)
  (cond ((= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (- (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else (remainder (* base (expmod base (- exp 1) m))
                         m))))

(define (square x)
  (* x x))




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
