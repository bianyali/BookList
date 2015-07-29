;#lang racket

(raise
 (condition
  (make-error)
  (make-message-condition "no go")))


(raise-continuable (condition (make-violation)
                              (make-message-condition "oops")))


(list (call/cc (lambda (k)
                 (vector (with-exception-handler (lambda (x)
                                                   (k (+ x 5)))
                                                 (lambda ()
                                                   (+ (raise 17) 8)))))))


(list (vector (with-exception-handler (lambda (x)
                                        (- x))
                                      (lambda ()
                                        (+ (raise-continuable 17) 8)))))

; (#(30))

(list (vector (with-exception-handler (lambda (x)
                                        (- x))
                                      (lambda ()
                                        (+ (raise-continuable 17) 8)))))
; (#(-9))


(list (vector (with-exception-handler (lambda (x)
                                        (+ x 5))
                                      (lambda ()
                                        (+ (raise 17) 8)))))


(define try (lambda (thunk)
              (call/cc (lambda (k)
                         (with-exception-handler (lambda (x)
                                                   (if (error? x) (k #f)
                                                       (raise x)))
                                                 thunk)))))

(try (lambda ()
       17))

(try (lambda ()
       (raise (make-error))))


(try (lambda ()
       (raise (make-violation))))

(with-exception-handler (lambda (x)
                          (raise (apply condition
                                        (make-message-condition "oops")
                                        (simple-conditions x))))
                        (lambda ()
                          (try (lambda ()
                                 (raise (make-violation))))))



;;; guard

(guard (x [else x])
       (raise "oopse"))


(guard (x [#f #f])
       (raise (make-error)))


(define-syntax try (syntax-rules ()
                     [(_ el e2...) (guard (x [(error? x) #f])
                                           e1 e2...)]))

(define open-one (lambda fn*
                   (let loop ([ls fn*])
                     (if (null? ls)
                         (error 'open-one "all open attempts failed" fn*)
                         (or (try (open-input-file (car ls)))
                             (loop (cdr ls)))))))

(open-one "foo.ss" "bar.ss")
(open-one "bar.ss")
