#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

;; recursive
(define (f n)
  (if (< n 3)
      n
      (+ (f (- n 1))
	 (* 2 (f (- n 2)))
	 (* 3 (f (- n 3))))))

;; iterative
(define (f n)
  (define (f-iter a b c count)
    (if (= count 0)
	a
	(f-iter b c (+ c (* 2 b) (* 3 a)) (- count 1))))
  (f-iter 0 1 2 n))

(define (main args)
  (print (f 0))
  (print (f 1))
  (print (f 2))
  (print (f 3))
  (print (f 4))
  (print (f 5))
  (print (f 6))
  (print (f 7))
  (print (f 8))
  (print (f 9))
  (print (f 10))
  0)
