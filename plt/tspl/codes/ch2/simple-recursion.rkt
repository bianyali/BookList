; Chaper 2.8 Simple Recursion

#lang racket

(define length-1 (lambda (ls)
                 (if (null? ls)
                     0
                     (+ (length-1 (cdr ls)) 1))))


(define length-2 (lambda (ls len)
                   (if (null? ls)
                       len
                       (length-2 (cdr ls) (+ len 1)))))


(define li '(1 2 3 4 5 6 6 6  32 12  312 32 13123 12 312 312 31   123 123 123 123 12 312 31 23 12 321 3 123 12 32 13123 21 312 312 312 ))
(time
 (length-1 li))

(time
 (length-2 li 0))



(define copy-list (lambda (li)
                    (if (null? li)
                        null
                        (cons (car li)
                              (copy-list (cdr li))))))


(copy-list '(1 2 3 4 5 ))


(define l1 '(1 2 3 (a b c)))
(define l2 (copy-list l1))

l1
l2


(define memv (lambda (x ls)
               (cond
                 [(null? ls) #f]
                 [(eqv? x (car ls)) ls]
                 [else (memv x (cdr ls))])))

(memv 'a '(a b c d))
(memv 'b '(a b b d))
(memv 'c '(a b b d))
(memv 'd '(a b c d))

(if (memv 'b '(a b b d))
    'yes
    'no)


(define remv (lambda (x ls)
               (cond
                 [(null? ls) '()]
                 [(eqv? x (car ls)) (remv x (cdr ls))]
                 [else (cons (car ls) (remv x (cdr ls)))])))

(remv 'a '(a b c d))
(remv 'b '(a b b d))
(remv 'c '(a b b d))
(remv 'd '(a b b d))



; tree-copy
(define tree-copy (lambda (tree)
                    (if (not (pair? tree))
                        tree
                        (cons (tree-copy (car tree))
                              (tree-copy (cdr tree))))))

(tree-copy '((a . b) . c) )


; map
(define abs-all-1 (lambda (li)
                  (if (null? li)
                      '()
                      (cons (abs (car li))
                            (abs-all-1 (cdr li))))))

(abs-all-1 '(-1 2 -3 4 -5))


(define abs-all-2 (lambda (li)
                    (map abs li)))

(abs-all-2 '(-1 2 -3 4 -5))


(map abs '(-1 2 -3 4 -5))

; map - square
(map (lambda (x)
       (* x x))
     '(-1 2 -3 4 -5))

(map cons '(0 1 2 3 4 5 6) '(6 5 4 3 2 1 0) )


; map - new version
(define map-new (lambda (op li)
                  (if (null? li)
                      '()
                      (cons (op (car li))
                            (map-new op (cdr li))))))

(map-new abs '(1 -2 3 -4 5 -6 7 -8))
