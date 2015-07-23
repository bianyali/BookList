; Section 3.4. Continuation Passing Style

#lang racket


; test the continuation effective field
(define hello-out (lambda ()
                    (define hello-inner (lambda ()
                                          (call-with-current-continuation (lambda (k)
                                                                            (k)
                                                                            (display 'What-a-fuck-1)
                                                                            (newline)))
                                          (display 'what-a-fuck-2)
                                          (newline)))
                    (display 'hello-world-1)
                    (newline)
                    (hello-inner)
                    (display 'hello-world-2)
                    (newline)
                    ))

(hello-out)



; explicit continuation
; -> (d b a c)
(letrec ([f (lambda (x)
              (cons 'a x))]
         [g (lambda (x)
              (cons 'b (f x)))]
         [h (lambda (x)
              (g (cons 'c x)))])
  (cons 'd (h '())))



; call/cc -> continuation

(define product-with-call/cc (lambda (ls)
                  (call/cc (lambda (break)
                             (let f ([ls ls])
                               (cond
                                 [(null? ls) 1]
                                 [(= (car ls) 0) (break 0)]
                                 [else (* (car ls)
                                          (f (cdr ls)))]))))))

(product-with-call/cc '(1 2 3 4 5))


(define product (lambda (ls k)
                  (let ([break k])
                    (let f ([ls ls] [k k])
                      (cond
                        [(null? ls) (k 1)]
                        [(= (car ls) 0) (break 0)]
                        [else (f (cdr ls)
                                 (lambda (x)
                                   (k (* (car ls) x))))])))))

(product '(1 2 3 4 5) (lambda (x) x))
