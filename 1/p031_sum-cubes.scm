#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cube x) (* x x x))

(define (sum-cubes a b)
  (if (> a b)
      0
      (+ (cube a) (sum-cubes (+ a 1) b))))

(define (main args)
  (print (sum-cubes 1 10))
  0)
