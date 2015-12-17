; Section 5.4. Recursion and Iteraction

#lang racket

(define factorial (lambda (n)
                    (do ([i n (- i 1)] [a 1 (* a i)])
                        ((zero? i) a))))

(factorial 10)


(define fibonacci (lambda (n)
                    (if (= n 0)
                        0
                        (do ([i n (- i 1)] [a1 1 (+ a1 a2)] [a2 0 a1])
                            ((= i 1) a1)))))

(fibonacci 6)


(define divisors (lambda (n)
                   (do ([i 2 (+ i 1)]
                        [ls '() (if (integer? (/ n i))
                                    (cons i ls)
                                    ls)])
                       ((>= i n) ls)
                     )))
