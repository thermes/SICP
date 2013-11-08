#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (integral f a b dx)
  (define (add-dx x) (+ x dx))
  (* (sum f (+ a (/ dx 2.0)) add-dx b)
     dx))

(define (main args)
  (print (integral cube 0 1 0.01))
  (print (integral cube 0 1 0.001))
  0)
