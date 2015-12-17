; Lambda Expressions

#lang racket

((lambda (x)
   (+ x x))
 (* 3 4))

(let ([double (lambda (x)
                (+ x x))])
  (list (double (* 3 4))
        (double (/ 99 11))
        (double (- 2 7))))

(let ([double-cons (lambda (x)
                     (cons x x))])
  (double-cons 'a))

(let ([double-any (lambda (f x)
                    (f x x))])
  (list (double-any + 13)
        (double-any cons 'a)))

(let ([x 'a])
  (let ([f (lambda (y) (list x y))])
    (f 'b)))


(let ([f (let ([x 'sam])
           (lambda (y z) (list x y z)))])
  (f 'i 'am))

(let ([f (let ([x 'sam])
           (lambda (y z)
             (list x y z)))])
  (let ([x 'not-sam])
    (f 'i 'am)))
