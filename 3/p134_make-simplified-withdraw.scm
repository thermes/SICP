#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-simplified-withdraw balance)
  (lambda (amount)
    (set! balance (- balance amount))
    balance))

(define (main args)
  (define W (make-simplified-withdraw 25))

  (print (W 20))
  (print (W 10))
  0)
