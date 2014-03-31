#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(use srfi-27)

(define (rand)
  (random-integer 16777216))

(define (estimate-pi trials)
  (sqrt (/ 6 (monte-carlo trials cesaro-test))))

(define (cesaro-test)
  (= (gcd (rand) (rand)) 1))

(define (monte-carlo trials experiment)
  (define (iter trials-remaining trials-passed)
    (cond ((= trials-remaining 0)
	   (/ trials-passed trials))
	  ((experiment)
	   (iter (- trials-remaining 1) (+ trials-passed 1)))
	  (else
	   (iter (- trials-remaining 1) trials-passed))))
  (iter trials 0))

(define (main args)
  (print (estimate-pi 10))
  (print (estimate-pi 100))
  (print (estimate-pi 1000))
  (print (estimate-pi 10000))
  (print (estimate-pi 100000))
  (print (estimate-pi 1000000))
  (print (estimate-pi 10000000))
  (print (estimate-pi 100000000))
  0)
