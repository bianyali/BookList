; Exercise 2.42
; eight-queens puzzle
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

(define (enumerate-interval m n)
  (cond ((> m n) null)
        ((= m n) (cons n null))
        ((< m n) (cons m (enumerate-interval (+ m 1) n)))))


; answers here

(define empty-board (list null))

(define (adjoin-position new-row k rest-of-queens)
   ;(display rest-of-queens)
   ;(newline)
  ; (display (list k new-row))
  ; (newline)
  ; (display (append rest-of-queens (list (list k new-row))))
  ; (newline)
  (if (null? (car rest-of-queens))
      (list (list k new-row))
      (append rest-of-queens (cons (list k new-row) null))))

(define (safe? k positions)
  ;(display positions)
  ;(newline)
  (define (is-check? pos-i pos-j)
    (if (= (cadr pos-i) (cadr pos-j))
        #f
        (if(= (abs (- (car pos-i) (car pos-j))) (abs (- (cadr pos-i) (cadr pos-j))))
           #f
           #t)))
  (define (iter pos-k pos-set)
    (if (null? pos-set)
        #t
        (and (is-check? pos-k (car pos-set))
             (iter pos-k (cdr pos-set)))))

  (let ((k-pos (car (filter (lambda (pos)
                          (= k (car pos)))
                        positions)))
        (pos-rest (filter (lambda (pos)
                            (not (= k (car pos))))
                          positions)))
    (iter k-pos pos-rest)))

; --------------------------


(define (queens board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter (lambda (positions)
                  ;(display positions)
                  ;(newline)
                  (safe? k positions))
                (flatmap (lambda (rest-of-queens)
                           (map (lambda (new-row)
                                  (adjoin-position new-row k rest-of-queens))
                                (enumerate-interval 1 board-size)))
                         (queen-cols (- k 1))))))

  (queen-cols board-size))

; one answer for eight-queens puzzle:
; (((1 3) (2 7) (3 2) (4 8) (5 5) (6 1) (7 4) (8 6))
;  ())
; (
;   ((1 1))
;   ((1 2))
;   ((1 3))
; )
; test
; ((1 1) (2 1))
; ((1 1) (2 2))(define t1 (current-milliseconds))



(define t1 (current-milliseconds))
(null? (queens 8))
(define t2 (current-milliseconds))

(display (- t2 t1))

; 688
; 21310
