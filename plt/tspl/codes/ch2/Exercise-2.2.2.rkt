#lang racket

; int int
(println "int - int: ")
(+ 1 -2)
(- 1 -2)
(* 1 -2)
(/ 1 -2)

; int float
(println "int - float: ")
(+ 1 -2.2)
(- 1 -2.2)
(* 1 -2.2)
(/ 1 -2.2)


; float float
(println "float - float: ")
(+ 1.2 -2.2)
(- 1.2 -2.2)
(* 1.2 -2.2)
(/ 1.2 -2.2)


; int retional
(println "int - retional: ")
(+ 1 1/4)
(- 1 1/4)
(* 1 1/4)
(/ 1 1/4)

; float retional
(println "float - retional: ")
(+ 2.2 1/3)
(- 2.2 1/3)
(* 2.2 1/3)
(/ 2.2 1/3)


; int complex
(println "int - complex: ")
(+ 1 (make-rectangular 1 2.2))
(- 1 (make-rectangular 1 2.2))
(* 1 (make-rectangular 1 2.2))
(/ 1 (make-rectangular 1 2.2))
