#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (even? n)
  (= (remainder n 2) 0))

(define (fast-expt b n)
  (define (fast-expt-iter b counter a)
    (cond ((= counter 0) a)
	  ((even? counter) (fast-expt-iter (square b) (/ counter 2) a))
	  (else (fast-expt-iter b (- counter 1) (* a b)))))
  (fast-expt-iter b n 1))

(define (main args)
  (print (fast-expt 2 0))
  (print (fast-expt 2 1))
  (print (fast-expt 2 2))
  (print (fast-expt 2 3))
  (print (fast-expt 2 4))
  (print (fast-expt 2 5))
  (print (fast-expt 2 6))
  (print (fast-expt 2 7))
  (print (fast-expt 2 8))
  (print (fast-expt 2 9))
  (print (fast-expt 2 10))
  0)
