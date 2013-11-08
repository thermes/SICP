#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
	  ((even? count)
	   (fib-iter a
		     b
		     (+ (square p) (square q))
		     (+ (square q) (* 2 p q))
		     (/ count 2)))
	  (else (fib-iter (+ (* b q) (* a q) (* a p))
			  (+ (* b p) (* a q))
			  p
			  q
			  (- count 1)))))
  (fib-iter 1 0 0 1 n))

(define (main args)
  (print (fib 0))
  (print (fib 1))
  (print (fib 2))
  (print (fib 3))
  (print (fib 4))
  (print (fib 5))
  (print (fib 6))
  (print (fib 7))
  (print (fib 8))
  (print (fib 9))
  (print (fib 10))
  0)
