#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (identity x) x)

(define (inc n) (+ n 1))

;; recursive
(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a)
		(accumulate combiner null-value term (next a) next b))))

;; iterative
(define (accumulate combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (sum term a next b)
  (accumulate + 0 term a next b))

(define (sum-integers a b)
  (sum identity a inc b))

(define (product term a next b)
  (accumulate * 1 term a next b))

(define (factorial n)
  (product identity 1 inc n))

(define (main args)
  (print (sum-integers 1 10))
  (print (factorial 6))
  0)
