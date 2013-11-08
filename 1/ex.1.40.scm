#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(define (main args)
  (print ((deriv cube) 5))
  (print (sqrt 2))
  (print (sqrt 4))
  0)
