#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

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

(define (main args)
  (print (prime? 1))
  (print (prime? 2))
  (print (prime? 3))
  (print (prime? 4))
  (print (prime? 5))
  (print (prime? 6))
  (print (prime? 7))
  (print (prime? 8))
  (print (prime? 9))
  (print (prime? 10))
  0)
