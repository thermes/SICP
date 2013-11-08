#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

;; recursive
(define (expt b n)
  (if (= n 0)
      1
      (* b (expt b (- n 1)))))

;; iterative
(define (expt b n)
  (define (expt-iter b counter product)
    (if (= counter 0)
	product
	(expt-iter b
		   (- counter 1)
		   (* b product))))
  (expt-iter b n 1))
	

(define (main args)
  (print (expt 2 0))
  (print (expt 2 1))
  (print (expt 2 2))
  (print (expt 2 3))
  (print (expt 2 4))
  (print (expt 2 5))
  (print (expt 2 6))
  (print (expt 2 7))
  (print (expt 2 8))
  (print (expt 2 9))
  (print (expt 2 10))
  0)
