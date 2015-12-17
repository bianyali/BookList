; Section 6.1 Constants and Quotations


#lang racket

`(+ 2 3)
`(+ 2 ,(* 3 4))
`(a b (,(+ 2 3) c) d)
`(a b ,(reverse '(c d e)) f g)
(let ([a 1] [b 2])
  `(,a . ,b))
`(+ ,@(cdr '(* 2 3)))
`(a b ,@(reverse '(c d e)) f g)
(let ([a 1] [b 2])
  `(,a ,@b))
`#(,@(list 1 2 3))
'`,(cons 'a 'b)
`',(cons 'a 'b)



'-------------------
#|
; error in racket lang
(let ([x '(m n)])
  ``(a ,@,@x f))

|#
