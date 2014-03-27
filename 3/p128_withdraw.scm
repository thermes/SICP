#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define balance 100)

(define (withdraw amount)
  (if (>= balance amount)
      (begin (set! balance (- balance amount))
	     balance)
      "Insufficient funds"))

(define (main args)
  (print (withdraw 25))
  (print (withdraw 25))
  (print (withdraw 60))
  (print (withdraw 15))
  0)
