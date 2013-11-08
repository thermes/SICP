#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (f g)
  (g 2))

(define (square x)
  (* x x))

(define (main args)
  (print (f square))
  (print (f (lambda (z) (* z (+ z 1)))))
  (f f)
  0)
