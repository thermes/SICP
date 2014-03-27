#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define new-withdraw
  (let ((balance 100))
    (lambda (amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))))

(define (main args)
  (print (new-withdraw 25))
  (print (new-withdraw 25))
  (print (new-withdraw 60))
  (print (new-withdraw 15))
  0)
