#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

;;; prime
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


(define (identity x) x)

(define (inc n) (+ n 1))

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
	((filter a)
	 (combiner (term a)
		   (filtered-accumulate combiner null-value term (next a) next b filter)))
	(else
	 (combiner null-value
		   (filtered-accumulate combiner null-value term (next a) next b filter)))))

;; a.
(define (sum-of-prime-squares a b)
  (filtered-accumulate + 0 square a inc b prime?))

(define (main args)
  (print (sum-of-prime-squares 2 5))
  0)
