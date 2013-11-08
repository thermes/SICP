#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

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

(define (full-fermat-test n)
  (define (iter a n)
    (cond ((= a n) #t)
	  ((= (expmod a n n) a) (iter (+ a 1) n))
	  (else #f)))
  (iter 1 n))
    
(define (fast-prime? n times)
  (cond ((= times 0) #t)
	((fermat-test n) (fast-prime? n (- times 1)))
	(else #f)))

(define (prime? n)
  (full-fermat-test n))

(define (main args)
  (print (prime? 561))
  (print (prime? 1105))
  (print (prime? 1729))
  (print (prime? 2465))
  (print (prime? 2821))
  (print (prime? 6601))
  0)
