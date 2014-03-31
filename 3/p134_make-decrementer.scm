#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))

(define (make-decrementer balance)
  (lambda (amount)
    (- balance amount)))

(define (main args)
  (define D (make-decrementer 25))

  (print (D 20))
  (print (D 10))
  0)
