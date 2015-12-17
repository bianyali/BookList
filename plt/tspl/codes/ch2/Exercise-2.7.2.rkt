; shorter

#lang racket

(define shorter (lambda (l1 l2)
                  (let ([len1 (length l1)] [len2 (length l2)])
                    (if (>= len2 len1)
                        l1
                        l2))))

(shorter '(a b) '(c d e))
(shorter '(a b) '(c d))
(shorter '(a b) '(c))
