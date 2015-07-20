#lang racket


;;; boolean
"---------Booleans----------"
(boolean? #f)
(boolean? #t)
(boolean? "Hello, World!")

(not #f)
(not #t)
(not "Hello, World!")


;;; numbers
"---------Numbers----------"
(number? 32)
(number? #t)
(complex? 2+3i)
(real? 2+3i)
(real? 3.1416)
(real? 22/7)
(real? 43)
(rational? 2+3i)
(rational? 3.1416)
(rational? 22/7)
(integer? 22/7)
(integer? 42)

; eqv?
(eqv? 42 42)   ; -> #t
(eqv? 42 #f)   ; -> #f
(eqv? 42 42.0) ; -> #f

; =
(= 43 43)   ; #t
;(= 42 #f)      ; ERROR!!!
(= 32 32.0) ; #t

; <, <=, >, >=
(< 3 2)
(>= 4.3 4)


; arithmetic procedures +, -, *, /, expt
(+ 1 2 3)
(- 5.2 3)
(- 4 2 1)
(* 1 2 3)
(/ 6 3)
(/ 22 7)
(expt 2 3)
(expt 4 1/2)

(max 1 2)
(min 1 3 4 5 2 3)


(abs 3)
(abs -4)

;;; Characters
"------------Characters-----------------"
(char? #\c)
(char? 1)
(char? #\;)

; comparision
(char=? #\a #\a)
(char<? #\a #\b)
(char>=? #\a #\b)

; comparisons case-insenstitive
(char-ci>=? #\a #\A)
(char-ci<? #\a #\B)

; char-downcase or char-upcase
(char-downcase #\A)
(char-upcase #\a)



"------------Symbols-----------------"
(quote xyz)

(define x 9)
(symbol? 'x)



"------------Strings-----------------"

"Hello, World!"

; string: the procedure string takes a bunch of characters and returns the string made from them:

(string #\h #\e #\l #\l #\l #\o)

(define greeting "Hello; Hello")
; Note that a semicolon inside a string datum deoes not trigger a comment.

(string-ref greeting 0)

(string-append "E " "Pluribus " "Unum")
(string-append greeting " End")
greeting
(make-string 3)
(define a-3-char-long-string (make-string 3))
(string? a-3-char-long-string)

(define hello (string #\H #\e #\l #\l #\o))
hello
(string-set! hello 1 #\a)
hello

(vector 0 1 2 3 4)
#(1 2 3 4 5)

(define v (make-vector 5))
v

; A dotted pair and lists
(cons 1 #t)

(define y (cons (cons 1 2) 3))
y


(list 1 2 3 4)

(list-tail (list 1 2 3 4) 2)

(string->list "hello world")

(list->string (list "hello" "world " "!"))
