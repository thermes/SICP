#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define us-coins (list 50 25 10 5 1))

(define uk-coins (list 100 50 20 10 5 2 1 0.5))

(define (cc amount coin-values)
  (cond ((= amount 0) 1)
	((or (< amount 0) (no-more? coin-values)) 0)
	(else
	 (+ (cc amount
		(except-first-denomination coin-values))
	    (cc (- amount
		   (first-denomination coin-values))
		coin-values)))))

(define first-denomination car)

(define except-first-denomination cdr)

(define no-more? null?)

(define (count-change-us amount)
  (cc amount us-coins))

(define (count-change-uk amount)
  (cc amount uk-coins))

(define (main args)
  (print (count-change-us 100))
  (print (count-change-uk 100))
  0)
