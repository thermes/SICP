#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cube x) (* x x x))

(define (inc n) (+ n 1))

(define (even? n)
  (= (remainder n 2) 0))

(define (sum term a next b)
  (if (> a b)
      0
      (+ (term a)
	 (sum term (next a) next b))))

(define (simpson-integral f a b n)
  (define even-n
    (+ n (remainder n 2)))
  (define h
    (/ (- b a) even-n))
  (define (simpson-term k)
    (define y
      (f (+ a (* k h))))
    (* (cond ((or (= k 0) (= k even-n)) 1)
	     ((even? k) 2)
	     (else 4))
       y))
  (* (/ h 3) (sum simpson-term 0 inc even-n)))

(define (main args)
  (print (simpson-integral cube 0 1 100))
  (print (simpson-integral cube 0 1 1000))
  0)
