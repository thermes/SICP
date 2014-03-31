#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-accumulator init)
  (let ((sum init))
    (lambda (n)
      (set! sum (+ sum n))
      sum)))

(define (main args)
  (define A (make-accumulator 5))

  (print (A 10))
  (print (A 10))
  0)
