#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(use srfi-27)

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt b (/ n 2))))
        (else (* b (fast-expt b (- n 1))))))

(define (expmod base exp m)
  (remainder (fast-expt base exp) m))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (prime? n)
  (fast-prime? n 3))

;; implement runtime function
;; Thanks to
;;   http://sicp.g.hatena.ne.jp/n-oohira/20090122
;;   http://swatmac.info/?p=478
(define (runtime)
  (use srfi-11)
  (let-values (((a b) (sys-gettimeofday)))
    (+ (* a 1000000) b)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime n (- (runtime) start-time))))

(define (report-prime n elapsed-time)
  (newline)
  (display n)
  (display " *** ")
  (display elapsed-time))

(define (search-for-primes first last) 
  (define (search-iter cur last) 
    (if (<= cur last) (timed-prime-test cur)) 
    (if (<= cur last) (search-iter (+ cur 2) last))) 
  (search-iter (if (even? first) (+ first 1) first) 
	       (if (even? last) (- last 1) last))) 

(define (main args)
  (search-for-primes 1000 1019)       ; 1e3 
  (search-for-primes 10000 10037)     ; 1e4 
  (search-for-primes 100000 100043)   ; 1e5 
  (search-for-primes 1000000 1000037) ; 1e6 
  (newline)
  0)

;; result

;; 1009 *** 215
;; 1013 *** 197
;; 1019 *** 230
;; 10007 *** 32320
;; 10009 *** 36819
;; 10037 *** 34188
;; 100003 *** 4404778
;; 100019 *** 5126467
;; 100043 *** 3471020
;; ... very slow
