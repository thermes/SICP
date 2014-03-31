#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(use srfi-27)

(define (square x)
  (* x x))

(define (random x)
  (cond ((is-a? x <integer>)
	 (random-integer x))
	((is-a? x <real>)
	 (* (random-real) x))
	(else
	 (error "Bad Type -- RANDOM" x))))

(define (random-in-range low high)
  (let ((range (- high low)))
    (+ low (random range))))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (estimate-integral P x1 x2 y1 y2 trials)
  (define (experiment)
    (P (random-in-range x1 x2)
       (random-in-range y1 y2)))
  (monte-carlo trials experiment))

(define (estimate-integral-pi trials)
  (let ((x1 2.0)
	(x2 8.0)
	(y1 4.0)
	(y2 10.0)
	(radius 3.0))
    (define (P x y)
      (<= (+ (square (- x 5))
	     (square (- y 7)))
	  (square radius)))
    (/ (* (estimate-integral P x1 x2 y1 y2 trials)
	  (* (- x2 x1)
	     (- y2 y1)))
       (square radius))))

(define (main args)
  (print (estimate-integral-pi 10))
  (print (estimate-integral-pi 100))
  (print (estimate-integral-pi 1000))
  (print (estimate-integral-pi 10000))
  (print (estimate-integral-pi 100000))
  (print (estimate-integral-pi 1000000))
  (print (estimate-integral-pi 10000000))
  (print (estimate-integral-pi 100000000))
  0)
