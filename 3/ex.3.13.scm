#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (last-pair x)
  (if (null? (cdr x))
      x
      (last-pair (cdr x))))

(define (make-cycle x)
  (set-cdr! (last-pair x) x)
  x)

(define (main args)
  (define z (make-cycle (list 'a 'b 'c)))
  #?=z

  ;; Don't eval. Because infinite loop.
  ;; (print (last-pair z))
  0)
