#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cube x) (* x x x))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-cubes a b)
  (sum cube a inc b))

(define (main args)
  (print (sum-cubes 1 10))
  0)
