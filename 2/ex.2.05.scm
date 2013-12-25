#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (my-cons x y)
  (* (expt 2 x) (expt 3 y)))

(define (my-car z)
  (base-count z 2))

(define (my-cdr z)
  (base-count z 3))

(define (base-count z base)
  (define (iter z count)
    (if (or (= z 0) (not (= (modulo z base) 0)))
	count
	(iter (/ z base) (+ count 1))))
  (iter z 0))

(define (main args)
  (print (my-car (my-cons 1 1)))
  (print (my-cdr (my-cons 1 1)))

  (print (my-car (my-cons 3 4)))
  (print (my-cdr (my-cons 3 4)))

  (print (my-car (my-cons 0 0)))
  (print (my-cdr (my-cons 0 0)))

  (newline)
  0)
