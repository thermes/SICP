#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (pi-sum a b)
  (if (> a b)
      0
      (+ (/ 1.0 (* a (+ a 2))) (pi-sum (+ a 4) b))))

(define (main args)
  (print (* 8 (pi-sum 1 1000)))
  (print (* 8 (pi-sum 1 10000)))
  (print (* 8 (pi-sum 1 100000)))
  (print (* 8 (pi-sum 1 1000000)))
  0)
