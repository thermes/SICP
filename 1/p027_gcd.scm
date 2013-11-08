#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (main args)
  (print (gcd 40 6))
  0)
