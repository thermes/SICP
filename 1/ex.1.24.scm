#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(use srfi-27)

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (expmod base exp m)
  (cond ((= exp 0) 1)
	((even? exp)
	 (remainder (square (expmod base (/ exp 2) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (prime? n)
  (fast-prime? n 100))

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

;; 1009 *** 698
;; 1013 *** 650
;; 1019 *** 614
;; 10007 *** 3097
;; 10009 *** 675
;; 10037 *** 699
;; 100003 *** 792
;; 100019 *** 819
;; 100043 *** 827
;; 1000003 *** 917
;; 1000033 *** 903
;; 1000037 *** 970

;; 1000000007 *** 1423
;; 1000000009 *** 1485
;; 1000000021 *** 1526
;; 10000000019 *** 3086
;; 10000000033 *** 3033
;; 10000000061 *** 5143
;; 100000000003 *** 3315
;; 100000000019 *** 3292
;; 100000000057 *** 5461
;; 1000000000039 *** 3229
;; 1000000000061 *** 5585
;; 1000000000063 *** 3411
;; 10000000000037 *** 5993
;; 10000000000051 *** 3628
;; 10000000000099 *** 5955
;; 100000000000031 *** 4001
;; 100000000000067 *** 6144
;; 100000000000097 *** 3722
;; 1000000000000037 *** 6223
;; 1000000000000091 *** 4325
;; 1000000000000159 *** 4391
;; 10000000000000061 *** 6747
;; 10000000000000069 *** 4373
;; 10000000000000079 *** 6631
