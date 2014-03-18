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


(define (make-from-real-imag x y)
  (define (dispatch op)
    (cond ((eq? op 'real-part) x)
	  ((eq? op 'imag-part) y)
	  ((eq? op 'magnitude)
	   (sqrt (+ (square x) (square y))))
	  ((eq? op 'angle) (atan y x))
	  (else
	   (error "Unknown op -- MAKE-FROM-REAL-IMAG" op))))
  dispatch)

(define (apply-generic op arg) (arg op))

(define (real-part z) (apply-generic 'real-part z))
(define (imag-part z) (apply-generic 'imag-part z))
(define (magnitude z) (apply-generic 'magnitude z))
(define (angle z) (apply-generic 'angle z))

(define (main args)
  (define z1 (make-from-real-imag 4 5))
  (define z2 (make-from-real-imag 2 3))

  (print (real-part (add-complex z1 z2)))
  (print (imag-part (add-complex z1 z2)))
  (print (real-part (sub-complex z1 z2)))
  (print (imag-part (sub-complex z1 z2)))
  0)
