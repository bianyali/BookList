; Exercise 1.8 Newton's method for cube root
;

; #lang racket

(define (cube-iter guess x)
  (if (good-engough? guess (improve guess x))
      guess
      (cube-iter (improve guess x) x)))

(define (good-engough? old-guess new-guess)
  (> 0.01
     (/ (abs (- new-guess old-guess))
        old-guess)))

(define (improve guess x)
  (/ (+ (/ x
           (* guess guess))
        (* 2 guess))
     3))


(define (cube x)
  (cube-iter 1.0 x))
