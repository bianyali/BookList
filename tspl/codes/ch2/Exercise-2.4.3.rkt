; Exercise 2.4.3
; give unique names to each different let-bound variable

#lang racket


; a.
(let ([x 'a] [y 'b])
  (list (let ([x 'c])
          (cons x y))
        (let ([y 'd])
          (cons x y))))

(let ([x 'a] [y 'b])
  (list (let ([xx 'c])
          (cons xx y))
        (let ([yy 'd])
          (cons x yy))))




; b.
(let ([x '((a b) c)])
  (cons (let ([xx (cdr x)])
          (cdr xx))
        (let ([xx (car x)])
          (cons (let ([xxx (cdr xx)])
                  (car xxx))
                (cons (let ([xxx (car xx)])
                        xxx)
                      (cdr xx))))))
; b.
(let ([x '((a b) c)])
  (cons (let ([x (cdr x)])
          (cdr x))
        (let ([x (car x)])
          (cons (let ([x (cdr x)])
                  (car x))
                (cons (let ([x (car x)])
                        x)
                      (cdr x))))))
