; Section 3.2: More Recursion

#lang racket

(require racket/trace)

(define factorial-1 (lambda (n)
                    (let fact ([i n])
                      (if (= i 0)
                          1
                          (* i (fact (- i 1)))))))

(factorial-1 0)
(factorial-1 1)
(factorial-1  2)
(factorial-1  3)
(factorial-1  10)


(define factorial-2 (lambda (n)
                      (let fact ([i n] [a 1])
                        (if (= i 0)
                            a
                            (fact (-i 1) (* a i))))))


(define fibonacci-1 (lambda (n)
                    (let fib ([i n])
                      (cond
                        [(= i 0) 0]
                        [(= i 1) 1]
                        [else (+ (fib (- i 1)) (fib (- i 2)))]))))
(fibonacci-1 0)
(fibonacci-1 1)
(fibonacci-1 2)
(fibonacci-1 3)
(fibonacci-1 4)
(fibonacci-1 5)
(fibonacci-1 6)
(fibonacci-1 20)
(fibonacci-1 30)


(define fibonacci-2 (lambda (n)
                      (if (= n 0)
                          0
                          (let fib ([i n] [a1 1] [a2 0])
                            ;(trace fib)
                            (if (= i 1)
                                a1
                                (fib (- i 1) (+ a1 a2) a1))))))
(fibonacci-2 0)
(fibonacci-2 1)
(fibonacci-2 2)
(fibonacci-2 3)
(fibonacci-2 4)
(fibonacci-2 5)
(fibonacci-2 6)
(fibonacci-2 20)
(fibonacci-2 30)


(display "----------------")
(newline)

(time (fibonacci-1 30))

(time (fibonacci-2 30))
(newline)
(display "----------------")


; tail-recursive or not
(define factor (lambda (n)
                 (let f ([n n] [i 2])
                   (cond
                     [(>= i n) (list n)]
                     [(integer? (/ n i)) (cons i (f (/ n i) i))]
                     [else (f n (+ i 1))]))))

(factor 0)
(factor 1)
(factor 12)
(factor 3628800)
(factor 9239)
