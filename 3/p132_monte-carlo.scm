#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define random-init 100)

(define (rand-update x)
  (let ((a 16385)
	(b 997)
	(m 16777216))
    (remainder (+ (* a x) b) m)))

(define rand
  (let ((x random-init))
    (lambda ()
      (set! x (rand-update x))
      x)))

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
  0)
