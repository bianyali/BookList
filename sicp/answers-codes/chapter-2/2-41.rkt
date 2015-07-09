; Exercise 2.41
; ordered-triples
;

#lang racket


(define (accumulate op init sequence)
  (if (null? sequence)
      init
      (op (car sequence)
          (accumulate op init (cdr sequence)))))

(define (flatmap op seq)
  (accumulate append null
              (map op seq)))


(define (unique-triples n)
  (let ((ranges (enumerate-interval 1 n)))
    (flatmap (lambda (i)
               (flatmap (lambda (j)
                          (map (lambda (k)
                                 (list i j k))
                               (remove j (remove i ranges))))
                    (remove  i ranges)))
             ranges)))


(define (enumerate-interval m n)
  (cond ((> m n) null)
        ((= m n) (cons n null))
        ((< m n) (cons m (enumerate-interval (+ m 1) n)))))

; (unique-triples 5)

(define (triples-sum n s)
  (filter (lambda (seq)
            (= s (accumulate + 0 seq)))
          (unique-triples n)))

; test

(triples-sum 15 15)
