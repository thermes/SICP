#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (double x)
  (+ x x))

(define (halve x)
  (/ x 2))

(define (* a b)
  (define (*-iter a counter result)
    (cond ((= counter 0) result)
	  ((even? counter) (*-iter (double a) (halve counter) result))
	  (else (*-iter a (- counter 1) (+ a result)))))
  (*-iter a b 0))

(define (main args)
  (print (* 0 0))
  (print (* 1 1))
  (print (* 2 2))
  (print (* 3 3))
  (print (* 4 4))
  (print (* 5 5))
  (print (* 6 6))
  (print (* 7 7))
  (print (* 8 8))
  (print (* 9 9))
  (print (* 10 10))
  0)
