#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (larger x y)
  (if (> x y)
      x
      y))

(define (largest-two-square-sum x y z)
  (if (< x y)
      (sum-of-squares y (larger x z))
      (sum-of-squares x (larger y z))))

(define (main args)
  (print (largest-two-square-sum 3 4 5))
  (print (largest-two-square-sum 3 5 4))
  (print (largest-two-square-sum 4 3 5))
  (print (largest-two-square-sum 4 5 3))
  (print (largest-two-square-sum 5 3 4))
  (print (largest-two-square-sum 5 4 3))
  (print (largest-two-square-sum 3 3 3))
  0)
