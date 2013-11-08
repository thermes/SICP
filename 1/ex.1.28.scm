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
	 (remainder (square (trivial-test (expmod base (/ exp 2) m) m))
		    m))
	(else
	 (remainder (* base (expmod base (- exp 1) m))
		    m))))

(define (trivial-test x m)
  (cond ((or (= x 1) (= x (- m 1))) x)
	((= (remainder (square x) m) 1) 0)
	(else x)))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random-integer (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((miller-rabin-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (prime? n)
  (fast-prime? n 10))

(define (main args)
  (print (prime? 561))
  (print (prime? 1105))
  (print (prime? 1729))
  (print (prime? 2465))
  (print (prime? 2821))
  (print (prime? 6601))
  0)
