; Continuations
;

#lang racket


; the continuation is captured and bound to k, but k is never used.
(call/cc (lambda (k)
           (* 5 4)))

; the continuation is invoked before the multiplication, so the value is the value passed to the continuation, 4
(call/cc (lambda (k)
           (* 5 (k 4))))


; the continuation includes the addition by 2; thus the value is the value passed to the continuation, 4 plus 2
(+ 2 (call/cc (lambda (k)
                (* 5 (k 4)))))


; a nonlocal exit from a recursion
(define product (lambda (ls)
                  (call/cc (lambda (break)
                             (let f ([ls ls])
                               (cond
                                 [(null? ls) 1]
                                 [(= (car ls) 0) (break 0)]
                                 [else (begin
                                         (display (car ls))
                                         (newline)
                                         (* (car ls)
                                          (f (cdr ls))))]))))))
; the nonlocal exit  allows product to return immediately, without performing the peding multiplications, when a zero value is detected.
(product '(1 2 3 4 5 6))
(product '(7 3 8 0 1 9 5))

; Each of the continuation invocations above returns to the combination while control remains within the procedure passed to call/cc.

; use the continuation after this procedure has already returned
(let ([x (call/cc (lambda (k) k))])
  (x (lambda (ignore) "hi")))



; most confusing Scheme program of its size;
(((call/cc (lambda (k) k))
  (lambda (x) x))
 "HEY!")


; factorial
(define retry #f)

(define factorial (lambda (x)
                    (if (= x 0) (call/cc (lambda (k) (set! retry k) 1))
                        (* x (factorial (- x 1))))))

(factorial 4)
(retry 1)
(retry 2)
