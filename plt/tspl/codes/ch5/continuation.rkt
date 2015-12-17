; Section 5.5 Continuations

#lang r6rs

;(require mzscheme)

(define member (lambda (x ls)
                 (call/cc (lambda (break)
                            (do ([ls ls (cdr ls)])
                                ((null? ls) #f)
                              (when (equal? x (car ls))
                                (break ls)))))))

(member 'd '(a b c))
(member 'b '(a b c))



;
(define x 12)

(let ((x 10))
  (let ((x 12))
    (display x))
  x)

;x



(let ([x 3])
  (+ (let ([x 5])
       x)
     x))



(let ([x 'a])
  (let ([f (lambda () x)])
    (cons (call/cc (lambda (k)
                     (let ([x 'b])
                       (k (f)))))
          (f))))


(define reenter #f)
(define x 0)
