#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (fib n)
  (cond ((= n 0) 0)
	((= n 1) 1)
	(else (+ (fib (- n 1))
		 (fib (- n 2))))))

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
