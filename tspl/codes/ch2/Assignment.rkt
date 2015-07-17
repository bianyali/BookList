; Assignment
;

#lang racket

(define abcde '(a b c d e))

(set! abcde (cdr abcde))

(let ([abcde '(a b c d e)])
  (set! abcde (reverse abcde))
  abcde)



; Kons
(define kons-count 0)
(define kons (lambda (x y)
               (set! kons-count (+ kons-count 1))
               (cons x y)))


(kons 'a '(b c))
(kons 'a (kons 'b (kons 'c '())))
kons-count


; Internal state - next

(define next 0)
(define count-1 (lambda ()
                (let ([v next])
                  (set! next (+ next 1))
                  v)))

(count-1) ; 0
(count-1) ; 1
(count-1) ; 2


; let-bing outside of the lambda expression
(define count-2 (let ([next 0])
                  (lambda ()
                    (let ([v next])
                      (set! next (+ next 1))
                      v))))

(count-2)
(count-2)
(count-2)


(define make-counter (lambda ()
                       (let ([next 0])
                         (lambda ()
                           (let ([v next])
                             (set! next (+ next 1))
                             v)))))

(define count-3 (make-counter))
(define count-4 (make-counter))

(count-3)
(count-3)
(count-3)

(count-4)


; state variable to be visiable at top level, we can use let and set! to make the procedures visibles at top level

(define shhh #f)
(define tell #f)

(let ([secret 0])
  (set! shhh (lambda (message)
               (set! secret message)))
  (set! tell (lambda ()
               secret)))

(shhh "sally likes harry")
(tell)
; secret



; Lazy evaluation
(define lazy (lambda (t)
               (let ([val #f] [flag #f])
                 (lambda ()
                   (when (not flag)
                       (begin (set! val (t))
                              (set! flag #t)))
                   val))))


(define pp (lazy (lambda ()
                  (display "Ouch!")
                  (newline)
                  "got me")))

(pp)
(pp)


; Make-stack

(define make-stack (lambda ()
                      (let ([ls '()])
                        (lambda (msg . args)
                          (cond
                            [(eqv? msg 'empty?) (null? ls)]
                            [(eqv? msg 'push!) (set! ls (cons (car args) ls))]
                            [(eqv? msg 'top) (car ls)]
                            [(eqv? msg 'pop!) (set! ls (cdr ls))]
                            [else "oopse"])))))


(define stack1 (make-stack))
(define stack2 (make-stack))
(list (stack1 'empty?) (stack2 'empty?))

(stack1 'push! 'a)
(list (stack1 'empty?) (stack2 'empty?))

(stack1 'push! 'b)
(stack2 'push! 'c)
(stack1 'top)
(stack2 'top)

(stack1 'pop!)
(stack1 'top)
(list (stack1 'empty?) (stack2 'empty?))

(stack1 'pop!)
(list (stack1 'empty?) (stack2 'empty?))
