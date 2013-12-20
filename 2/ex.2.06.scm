#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define zero
  (lambda (f)
    (lambda (x)
      x)))

(define (add-1 n)
  (lambda (f)
    (lambda (x)
      (f ((n f) x)))))

; (add-1 zero)
; ↓
; (lambda (f) (lambda (x) (f ((zero f) x))))
; ↓
; (lambda (f) (lambda (x) (f ((((lambda (f) (lambda (x) x))) f) x))))


; (((add-1 zero) (lambda (n) (+ n 1))) 100)
; ↓
; (((lambda (f) (lambda (x) (f ((zero f) x)))) (lambda (n) (+ n 1))) 100)
; ↓
; ((lambda (n) (+ n 1)) ((zero (lambda (n) (+ n 1))) 100))
; ↓
; ((lambda (n) (+ n 1)) (((lambda (f) (lambda (x) x)) (lambda (n) (+ n 1))) 100))

(define one
  (lambda (f)
    (lambda (x)
      (f x))))

; (((add-1 one) (lambda (n) (+ n 1))) 100)
; ↓
; (((lambda (f) (lambda (x) (f ((one f) x)))) (lambda (n) (+ n 1))) 100)
; ↓
; ((lambda (n) (+ n 1)) ((one (lambda (n) (+ n 1))) 100))
; ↓
; ((lambda (n) (+ n 1)) (((lambda (f) (lambda (x) (f x))) (lambda (n) (+ n 1))) 100))

(define two
  (lambda (f)
    (lambda (x)
      (f (f x)))))

(define three
  (lambda (f)
    (lambda (x)
      (f (f (f x))))))

(define (plus m n)
  (lambda (f)
    (lambda (x)
      ((m f) ((n f) x)))))

(define (mult m n)
  (lambda (f)
    (lambda (x)
      ((m (n f)) x))))

(define (main args)
  (print ((zero (lambda (n) (+ n 1))) 0))
  (print ((one (lambda (n) (+ n 1))) 0))
  (print ((two (lambda (n) (+ n 1))) 0))
  (print ((three (lambda (n) (+ n 1))) 0))

  (print (((plus two three) (lambda (n) (+ n 1))) 0))
  (print (((mult two three) (lambda (n) (+ n 1))) 0))
)
