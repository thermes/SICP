#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define random-init 8)

(define (rand-update x)
  (let ((a 3)
	(b 5)
	(m 13))
    (remainder (+ (* a x) b) m)))

(define rand
  (let ((x random-init))
    (define (dispatch m)
      (cond ((eq? m 'generate)
	     (set! x (rand-update x))
	     x)
	    ((eq? m 'reset)
	     (lambda (new-value)
	       (set! x new-value)))))
    dispatch))

(define (main args)
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))

  ((rand 'reset) 0)

  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))

  ((rand 'reset) 1)

  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))

  ((rand 'reset) 2)

  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))

  ((rand 'reset) 3)

  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))

  ((rand 'reset) 4)

  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  (print (rand 'generate))
  0)
