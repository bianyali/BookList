; Chapter 8: Macro

#lang racket

(require compatibility/defmacro)

(define-macro my-or (lambda (x y)
                      `(if ,x ,x ,y)))



(my-or
 (begin
   (display "doing something in first argument")
   (newline)
   #t)
 2)
