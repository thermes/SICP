#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-withdraw balance)
  (lambda (amount)
    (if (>= balance amount)
	(begin (set! balance (- balance amount))
	       balance)
	"Insufficient funds")))

(define (main args)
  (define W1 (make-withdraw 100))
  (define W2 (make-withdraw 100))

  (print (W1 50))
  (print (W2 70))
  (print (W2 40))
  (print (W1 40))
  0)
