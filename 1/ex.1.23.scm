#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (next n)
  (if (= n 2)
      3
      (+ n 2)))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor)))))

(define (divides? a b)
  (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

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
  
					; As of 2008, computers have become too fast to appreciate the time
					; required to test the primality of such small numbers.
					; To get meaningful results, we should perform the test with numbers
					; greater by, say, a factor 1e6.
  (newline)
  (search-for-primes 1000000000 1000000021)               ; 1e9
  (search-for-primes 10000000000 10000000061)             ; 1e10
  (search-for-primes 100000000000 100000000057)           ; 1e11
  (search-for-primes 1000000000000 1000000000063)         ; 1e12
  (search-for-primes 10000000000000 10000000000099)       ; 1e13
  (search-for-primes 100000000000000 100000000000097)     ; 1e14
  (search-for-primes 1000000000000000 1000000000000159)   ; 1e15
  (search-for-primes 10000000000000000 10000000000000079) ; 1e16
  (newline)
  0)

;; result

;; 1009 *** 6
;; 1013 *** 5
;; 1019 *** 5
;; 10007 *** 16
;; 10009 *** 16
;; 10037 *** 16
;; 100003 *** 51
;; 100019 *** 51
;; 100043 *** 50
;; 1000003 *** 159
;; 1000033 *** 159
;; 1000037 *** 159

;; 1000000007 *** 4577
;; 1000000009 *** 4452
;; 1000000021 *** 4509
;; 10000000019 *** 13958
;; 10000000033 *** 14049
;; 10000000061 *** 14025
;; 100000000003 *** 44177
;; 100000000019 *** 44076
;; 100000000057 *** 44127
;; 1000000000039 *** 138068
;; 1000000000061 *** 137786
;; 1000000000063 *** 137400
;; 10000000000037 *** 433000
;; 10000000000051 *** 434736
;; 10000000000099 *** 439751
;; 100000000000031 *** 1367168
;; 100000000000067 *** 1375558
;; 100000000000097 *** 1358470
;; 1000000000000037 *** 4308967
;; 1000000000000091 *** 4312330
;; 1000000000000159 *** 4317349
;; 10000000000000061 *** 13818160
;; 10000000000000069 *** 13743356
;; 10000000000000079 *** 13645561
