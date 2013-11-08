#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (smallest-divisor n)
  (find-divisor n 2))

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (+ test-divisor 1)))))

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

;; 1009 *** 8
;; 1013 *** 8
;; 1019 *** 7
;; 10007 *** 30
;; 10009 *** 23
;; 10037 *** 26
;; 100003 *** 74
;; 100019 *** 74
;; 100043 *** 74
;; 1000003 *** 234
;; 1000033 *** 233
;; 1000037 *** 234

;; 1000000007 *** 7313
;; 1000000009 *** 7423
;; 1000000021 *** 7426
;; 10000000019 *** 24036
;; 10000000033 *** 23408
;; 10000000061 *** 23300
;; 100000000003 *** 73267
;; 100000000019 *** 74103
;; 100000000057 *** 73857
;; 1000000000039 *** 231326
;; 1000000000061 *** 231888
;; 1000000000063 *** 233612
;; 10000000000037 *** 731906
;; 10000000000051 *** 711660
;; 10000000000099 *** 706206
;; 100000000000031 *** 2238508
;; 100000000000067 *** 2240266
;; 100000000000097 *** 2252214
;; 1000000000000037 *** 7144406
;; 1000000000000091 *** 7065142
;; 1000000000000159 *** 7058271
;; 10000000000000061 *** 22252347
;; 10000000000000069 *** 22227290
;; 10000000000000079 *** 22230067
