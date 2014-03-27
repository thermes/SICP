#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define random-init 8)

(define (rand-update x)
  (let ((a 3)
	(b 5)
	(m 13))
    (remainder (+ (* a x) b) m)))

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

(define (main args)
  (print (rand))
  (print (rand))
  (print (rand))
  (print (rand))
  (print (rand))
  (print (rand))
  0)
