#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (main args)
  (print (sum-of-squares 3 4))
  0)
