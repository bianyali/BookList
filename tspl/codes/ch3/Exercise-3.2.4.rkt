; Exercise 3.2.4
;

#lang racket


(define fibonacci-2 (lambda (n)
                      (if (= n 0)
                          0
                          (let fib ([i n] [a1 1] [a2 0] [count 0])
                            ;(trace fib)
                            (if (= i 1)
                                (list a1 count)
                                (fib (- i 1) (+ a1 a2) a1 (+ count 1)))))))
(fibonacci-2 0)
(fibonacci-2 1)
(fibonacci-2 2)
(fibonacci-2 3)
(fibonacci-2 4)
(fibonacci-2 5)
(fibonacci-2 6)
(fibonacci-2 20)
(fibonacci-2 30)
