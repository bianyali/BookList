; Section 5.3. Conditionals

#lang racket

; and
(let ([x 3])
  (and (> x 2) (< x 4)))

(let ([x 5])
  (and (> x 2) (< x 4)))

(let ([x 3])
  (and (> x 2) (+ x 4)))


(and #f '(a b) '(c d))

(and #t
     (display 1)
     (newline)
     (display 2))



; or
(newline)
"-------------------"
(or #f
    ;(display 1)
    1
    #f)

(or)


(newline)
"cond -------------------"
(display (cond
           [#f (display "1\n")]
           [#f (display "2\n")]
           [#f (display "3\n")]
           [#f (display "4\n")]
           ))
