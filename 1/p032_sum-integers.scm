#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (identity x) x)

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (inc n) (+ n 1))

(define (sum-integers a b)
  (sum identity a inc b))

(define (main args)
  (print (sum-integers 1 10))
  0)
