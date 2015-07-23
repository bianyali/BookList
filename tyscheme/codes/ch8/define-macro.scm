; Chapter 8: Macro

#lang racket

(require compatibility/defmacro)

(define-macro my-or-1 (lambda (x y)
                      `(if ,x ,x ,y)))



; It re-evaluates the first argument if it it true: once in the if-test, and once again in the "then" branch.
(my-or-1
 (begin
   (display "doing something in first argument")
   (newline)
   #t)
 2)


"-----in my-or-2 ------------"
; store the if-test result in a local variable
(define-macro my-or-2
  (lambda (x y)
    `(let ((temp ,x))
       (if temp temp
           ,y))))


(my-or-2 (begin
           (display "do somethign in first argument")
           (newline))
         "hello world")



; choose outlandish names for such variables and hope fervently that nobody else comse up with them.
(define-macro my-or-3 (lambda (x y)
                        '(let ((+temp ,x))
                           (if +temp + temp ,y))))

; this will work given the tacit understanding that +temp will not be used by code outside the macro.

; gensym
(define-macro my-or-4 (lambda (x y)
                        (let ((temp (gensym)))
                          `(let ((,temp ,x))
                             (if ,temp ,temp ,y)))))
