#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (cons x y)
  (lambda (m) (m x y)))

(define (car z)
  (z (lambda (p q) p)))

;; (car (cons 1 2))
;; ↓
;; ((lambda (m) (m 1 2)) (lambda (p q) p))
;; ↓
;; ((lambda (p q) p) 1 2)

(define (cdr z)
  (z (lambda (p q) q)))

(define (main args)
  (print (car (cons 1 2)))
  (print (cdr (cons 1 2)))
  0)
