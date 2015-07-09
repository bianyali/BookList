; Exercise 1.6:
; Alyssa P.Hacker doesn't see why "if" needs to be provided as a special form.
; "Why can't just define it as an ordinary procedure in terms of cond?" she asks.
; Alyssa's friend Eva Lu Ator claims this can indeed be done, and she defined a
; new version of if:

(define (new-if predict then-clause else-clause)
  (cond (predict then-clause)
        (else else-clause)))

(new-if (= 2 3) 0 5)
(new-if (= 1 1) 0 5)

(define (sqrt-iter-with-new-if guess x)
  (new-if (good-engough? guess x)
          guess
          (sqrt-iter-sqrt-with-new-if (improve guess x) x)))

(define (sqrt-iter guess x)
  (if (good-engough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (good-engough? guess x)
  (< (abs (- (* guess guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x1 x2)
  (/ (+ x1 x2) 2))
