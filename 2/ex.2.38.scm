#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define fold-right accumulate)

(define (fold-left op initial sequence)
  (define (iter result rest)
    (if (null? rest)
	result
	(iter (op result (car rest))
	      (cdr rest))))
  (iter initial sequence))

(define (main args)
  (print (fold-right / 1 (list 1 2 3)))
  (print (fold-left / 1 (list 1 2 3)))

  (print (fold-right list nil (list 1 2 3)))
  (print (fold-left list nil (list 1 2 3)))

  (print (fold-left + 0 (list 1 2 3 4)))
  (print (fold-right + 0 (list 1 2 3 4)))
  0)
