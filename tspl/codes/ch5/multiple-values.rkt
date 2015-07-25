; Section 5.8. Multiple values

#lang racket


;(+ 1 2)
;(+ (list 1 2))
;(+ (values 1 2))


(call-with-values (lambda ()
                    (call/cc (lambda (k)
                               (k 2 3))))
                  (lambda (x y)
                    (list x y)))


#|
(if (values 1 2)
    'x
    'y)

|#

(values)
(+ (values 1) 5)
