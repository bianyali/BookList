; Exercise 2.69
; generate-huffman-tree
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




; test
(define pairs '((A 4) (B 2) (C 1) (D 1)))
(define sample-tree (generate-huffman-tree pairs))

sample-tree
(newline)





;
(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        null
        (let ((next-branch (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))


(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))



(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(decode sample-message sample-tree)


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

(encode (decode sample-message sample-tree) sample-tree)
