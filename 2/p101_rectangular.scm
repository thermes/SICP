#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (square x)
  (* x x))

(define (add-complex z1 z2)
  (make-from-real-imag (+ (real-part z1) (real-part z2))
		       (+ (imag-part z1) (imag-part z2))))

(define (sub-complex z1 z2)
  (make-from-real-imag (- (real-part z1) (real-part z2))
		       (- (imag-part z1) (imag-part z2))))

(define (mul-complex z1 z2)
  (make-from-mag-ang (* (magnitude z1) (magnitude z2))
		     (+ (angle z1) (angle z2))))

(define (div-complex z1 z2)
  (make-from-mag-ang (/ (magnitude z1) (magnitude z2))
		     (- (angle z1) (angle z2))))

(define (real-part z) (car z))

(define (imag-part z) (cdr z))

(define (magnitude z)
  (sqrt (+ (square (real-part z)) (square (imag-part z)))))

(define (angle z)
  (atan (imag-part z) (real-part z)))

(define (make-from-real-imag x y) (cons x y))

(define (make-from-mag-ang r a)
  (cons (* r (cos a)) (* r (sin a))))

(define (main args)
  (define z1 (make-from-real-imag 4 5))
  (define z2 (make-from-real-imag 2 3))

  (print (real-part (add-complex z1 z2)))
  (print (imag-part (add-complex z1 z2)))
  (print (real-part (sub-complex z1 z2)))
  (print (imag-part (sub-complex z1 z2)))
  (print (real-part (mul-complex z1 z2)))
  (print (imag-part (mul-complex z1 z2)))
  (print (real-part (div-complex z1 z2)))
  (print (imag-part (div-complex z1 z2)))
  0)
