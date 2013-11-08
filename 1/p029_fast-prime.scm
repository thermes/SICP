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

(define (main args)
  (print (fast-prime? 2 10))
  (print (fast-prime? 3 10))
  (print (fast-prime? 4 10))
  (print (fast-prime? 5 10))
  (print (fast-prime? 6 10))
  (print (fast-prime? 7 10))
  (print (fast-prime? 8 10))
  (print (fast-prime? 9 10))
  (print (fast-prime? 10 10))
  0)
