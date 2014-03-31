#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define random-init 100)

(define (rand-update x)
  (let ((a 16385)
	(b 997)
	(m 16777216))
    (remainder (+ (* a x) b) m)))

(define (estimate-pi trials)
  (sqrt (/ 6 (random-gcd-test trials random-init))))

(define (random-gcd-test trials initial-x)
  (define (iter trials-remaining trials-passed x)
    (let ((x1 (rand-update x)))
      (let ((x2 (rand-update x1)))
	(cond ((= trials-remaining 0)
	       (/ trials-passed trials))
	      ((= (gcd x1 x2) 1)
	       (iter (- trials-remaining 1)
		     (+ trials-passed 1)
		     x2))
	      (else
	       (iter (- trials-remaining 1)
		     trials-passed
		     x2))))))
  (iter trials 0 initial-x))

(define (main args)
  (print (estimate-pi 10))
  (print (estimate-pi 100))
  (print (estimate-pi 1000))
  (print (estimate-pi 10000))
  0)
