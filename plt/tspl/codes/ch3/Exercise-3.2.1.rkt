; Exercise 3.2.1

#lang racket

#|

; non-tail
(let ([sum (lambda (ls)
             (if (null? ls)
                 0
                 (+ (car ls) (sum (cdr ls)))))])
  (sum '(1 2 3 4 5)))

; non-tail
(let ([sum (lambda (sum ls)
             (if (null? ls)
                 0
                 (+ (car ls) (sum sum (cdr ls)))))])
  (sum '(1 2 3 4 5)))


; non-tail
(letrec ([sum (lambda (ls)
                (if (null? ls)
                    0
                    (+ (car ls) (sum (cdr ls)))))])
  (sum '(1 2 3 4 5)))

|#



#|

; tail
(letrec ([even? (lambda (x)
                  (or (= x 0)
                      (odd? (- x 1))))]
         [odd? (lambda (x)
                 (and (not (= x 0)
                           (even? (- x 1)))))]))
|#


#|
; list?
; tail
(define list?
  (lambda (x)
    (letrec ([race (lambda (h t)
                     (if (pair? h)
                         (let ([h (cdr h)])
                           (if (pair? h)
                               (and (not (eq? h t))
                                    (race (cdr h) (cdr t)))
                               (null? h)))
                         (null? h)))])
      (race x x))))

|#


#|
; tail f
(lambda ()
  (f (g)))

; tail f
(lambda ()
  (if (g) (f) (f)))

; tail f
(lambda ()
  (let ([x 4])
    (f)))

; tail f
(lambda ()
  (or (g) (f)))

|#



; factorial-1 non-tail
; factorial-2 tail
; fibonacci-1 non-tail
; fibonacci-2 tail
; factor tail/non-tail
