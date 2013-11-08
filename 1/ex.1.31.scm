#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (identity x) x)

(define (inc n) (+ n 1))

;; recursive
(define (product term a next b)
  (if (> a b)
      1
      (* (term a)
	 (product term (next a) next b))))

;; iterative
(define (product term a next b)
  (define (iter a result)
    (if (> a b)
	result
	(iter (next a) (* result (term a)))))
  (iter a 1))

(define (factorial n)
  (product identity 1 inc n))

(define (pi-term n)
  (if (even? n)
      (/ (+ n 2) (+ n 1))
      (/ (+ n 1) (+ n 2))))

(define (main args)
  (print (factorial 5))
  (print (factorial 6))
  (print (* 4.0 (product pi-term 1 inc 100)))
  (print (* 4.0 (product pi-term 1 inc 1000)))
  (print (* 4.0 (product pi-term 1 inc 2000)))
  0)
