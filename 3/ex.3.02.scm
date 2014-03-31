#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-monitored f)
  (let ((count 0))
    (define (mf arg)
      (cond ((eq? arg 'how-many-calls?)
	     count)
	    ((eq? arg 'reset-count)
	     (set! count 0))
	    (else
	     (set! count (+ count 1))
	     (f arg))))
    mf))

(define (main args)
  (define s (make-monitored sqrt))

  (print (s 100))
  (print (s 'how-many-calls?))

  (print (s 10000))
  (print (s 'how-many-calls?))

  (s 'reset-count)
  (print (s 'how-many-calls?))

  (print (s 25))
  (print (s 'how-many-calls?))
  0)
