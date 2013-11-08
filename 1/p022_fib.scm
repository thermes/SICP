#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (fib-iter a b count)
  (if (= count 0)
      b
      (fib-iter (+ a b) a (- count 1))))

(define (fib n)
  (fib-iter 1 0 n))

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
