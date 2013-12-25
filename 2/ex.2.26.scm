#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define x (list 1 2 3))

(define y (list 4 5 6))

(define (main args)
  (print (append x y))
  (print (cons x y))
  (print (list x y))              
  0)
