; Exercise 2.4.1

#lang racket


#|
;a.
(+ (- (* 3 'a) 'b)
   (+ (* 3 'a) 'b))

(let ([x (* 3 'a)])
  (+ (- x 'b)
     (+ x 'b)))
|#


;b.
(cons (car (list 'a 'b 'c))
      (cdr (list 'a 'b 'c)))


(let ([x (list 'a 'b 'c)])
  (cons (car x)
        (cdr x)))
#|
|#
