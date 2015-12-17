; Chapter 13: Jumps

#lang racket

(define x '#f)

(let ()
  (let ()
    (call/cc (lambda (k)
               (set! x k)
               (x)
               "what are you fucking talking about."))
    (display "1.0 In let field.\n")
    (display "2.0 In let field\n"))
  (display "3.0 In let field\n")
  )


(display "1.0 In global field\n")

(x)


(let ()
  (x)
  (display "this is just a test: this subform will never displayed in screen."))

;(display "2.0 In global field\n")

;(display "hello Scheme!");


;(newline)
;(newline)
;(newline)
;(newline)


(define same-fringe? (lambda (tree1 tree2)
                       (let loop ((ftree1 (flatten tree1))
                                  (ftree2 (flatten tree2)))
                         (cond
                           [(and (null? ftree1) (null? ftree2)) #t]
                           [(or (null? ftree1) (null? ftree2)) #f]
                           [(eqv? (car ftree1) (car ftree2)) (loop (cdr ftree1) (cdr ftree2))]
                           [else #f]
                           ))))

(define flatten (lambda (tree)
                    (cond
                      [(null? tree) '()]
                      [(pair? (car tree)) (append (flatten (car tree))
                                                  (flatten (cdr tree)))]
                      [else (cons (car tree)
                                  (flatten (cdr tree)))])))

(same-fringe? '(1 (2 3)) '((1 2) 3))

(same-fringe? '(1 2 3) '(1 (3 2)))


; tree->generator
(define tree->generator (lambda (tree)
                          (let ((caller '*))
                            (letrec ((generate-leaves (lambda ()
                                                        (let loop ((tree tree))
                                                          (cond
                                                            [(null? tree) 'skip]
                                                            [(pair? tree)
                                                             (loop (car tree))
                                                             (loop (cdr tree))]
                                                            [else (call/cc (lambda (rest-of-tree)
                                                                             (set! generate-leaves (lambda ()
                                                                                                     (rest-of-tree 'resume)))
                                                                             (caller tree)))]))
                                                        (caller '()))))
                              (lambda () (call/cc (lambda (k)
                                                    (set! caller k)
                                                    (generate-leaves))))))))




(define same-fringe?-2 (lambda (tree1 tree2)
                       (let ((gen1 (tree->generator tree1))
                             (gen2 (tree->generator tree2)))
                         (let loop ()
                           (let ((leaf1 (gen1))
                                 (leaf2 (gen2)))
                             (if (eqv? leaf1 leaf2) (if (null? leaf1) #t (loop))
                                 #f))))))

