; Exercise 2.70
; lyrics encoding
;

#lang racket

; leaf
(define (make-leaf symbol weight)
  (list 'leaf symbol weight))

(define (leaf? object)
  (eq? (car object) 'leaf))

(define (symbol-leaf x)
  (cadr x))

(define (weight-leaf x)
  (caddr x))


; code-tree
(define (make-code-tree left right)
  (list left
        right
        (append (symbols left) (symbols right))
        (+ (weight left) (weight right))))

(define (left-branch tree)
  (car tree))

(define (right-branch tree)
  (cadr tree))

(define (symbols tree)
  (if (leaf? tree)
      (list (symbol-leaf tree))
      (caddr tree)))

(define (weight tree)
  (if (leaf? tree)
      (weight-leaf tree)
      (cadddr tree)))



(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge leaf-set)
  (if (> 2 (length leaf-set))
      (car leaf-set)
      (successive-merge (adjoin-set (make-code-tree (car leaf-set)
                                                    (cadr leaf-set))
                                    (cddr leaf-set)))))


(define (adjoin-set leaf leaf-set)
  (cond ((null? leaf-set) (cons leaf null))
        ((< (weight leaf) (weight (car leaf-set))) (cons leaf leaf-set))
        (else (cons (car leaf-set) (adjoin-set leaf (cdr leaf-set))))))

; ordered set: set(2) > set(1)
(define (make-leaf-set pairs)
  (if (null? pairs)
      null
      (adjoin-set (make-leaf (car (car pairs)) (cadr (car pairs)))
            (make-leaf-set (cdr pairs)))))


(define (element-of-symbols? alpha seq)
  (cond  ((null? seq) #f)
         ((eq? (car seq) alpha) #t)
         (else (element-of-symbols? alpha (cdr seq)))))



(define (encode message tree)
  (if (null? message)
      null
      (append (encode-symbol (car message) tree)
              (encode (cdr message) tree))))

(define (encode-symbol bit tree)
  (cond ((leaf? tree) (if (eq? bit (symbol-leaf tree))
                          null
                          (error "Error: " bit)))
        ((element-of-symbols? bit (symbols (left-branch tree))) (cons 0 (encode-symbol bit (left-branch tree))))
        ((element-of-symbols? bit (symbols (right-branch tree))) (cons 1 (encode-symbol bit (right-branch tree))))
        (else (error "Error: " bit))))


; test
(define pairs '((A 2) (BOOM 1) (GET 2) (JOB 2) (NA 16) (SHA 3) (YIP 9) (WAH 1)))
(define sample-tree (generate-huffman-tree pairs))
(define message '(
                  GET A JOB
                  SHA NA NA NA NA NA NA NA NA
                  GET A JOB
                  SHA NA NA NA NA NA NA NA NA
                  WAH YIP YIP YIP YIP YIP YIP YIP YIP YIP
                  SHA BOOM
                  ))
(display (encode message sample-tree))
(newline)
