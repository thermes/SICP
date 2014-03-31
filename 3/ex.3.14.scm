#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (mystery x)
  (define (loop x y)
    (if (null? x)
	y
	(let ((temp (cdr x)))
	  (set-cdr! x y)
	  (loop temp x))))
  (loop x '()))

(define (main args)
  (let ()
    (define v (list 'a 'b 'c 'd))
    (print v))

  (let ()
    (define v (list 'a 'b 'c 'd))
    (define w (mystery v))
    (print w))
  0)
