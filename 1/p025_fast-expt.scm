#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (fast-expt b n)
  (cond ((= n 0) 1)
	((even? n) (square (fast-expt b (/ n 2))))
	(else (* b (fast-expt b (- n 1))))))

(define (even? n)
  (= (remainder n 2) 0))

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
