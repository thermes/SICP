#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (main args)
  (print (square 21))
  (print (square (+ 2 5)))
  (print (square (square 3)))
  0)
