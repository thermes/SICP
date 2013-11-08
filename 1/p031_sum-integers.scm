#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (sum-integers a b)
  (if (> a b)
      0
      (+ a (sum-integers (+ a 1) b))))

(define (main args)
  (print (sum-integers 1 10))
  0)
