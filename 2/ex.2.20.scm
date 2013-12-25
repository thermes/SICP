#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (same-parity first . items)
  (define (filter predicate items)
    (cond ((null? items)
	   nil)
	  ((predicate (car items))
	   (cons (car items) (filter predicate (cdr items))))
	  (else
	   (filter predicate (cdr items)))))
  (filter (if (odd? first) odd? even?) (cons first items)))

(define (main args)
  (print (same-parity 1 2 3 4 5 6 7))
  (print (same-parity 2 3 4 5 6 7))
  (print (same-parity 3 4 5 6 7))
  0)
