#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-account balance password)
  (let ((failed-count 0))
    (define (withdraw amount)
      (if (>= balance amount)
	  (begin (set! balance (- balance amount))
		 balance)
	  "Insufficient funds"))
    (define (deposit amount)
      (set! balance (+ balance amount))
      balance)
    (define (call-the-cops)
      "Call the cops")
    (define (dispatch p m)
      (cond ((not (eq? p password))
	     (set! failed-count (+ failed-count 1))
	     (if (>= failed-count 7)
		 (lambda (x) (call-the-cops))
		 (lambda (x) "Incorrect password")))
	    (else
	     (set! failed-count 0)
	     (cond ((eq? m 'withdraw) withdraw)
		   ((eq? m 'deposit) deposit)
		   (else (error "Unknown request -- MAKE-ACCOUNT"
				m))))))
    dispatch))

(define (make-joint account old-password new-password)
  (define (dispatch p m)
    (if (eq? p new-password)
	(account old-password m)
	(account 'incorrect-password m)))
  dispatch)

(define (main args)
  (define peter-acc (make-account 100 'open-sesame))
  (define paul-acc (make-joint peter-acc 'open-sesame 'rosebud))

  (print ((paul-acc 'rosebud 'withdraw) 40))

  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))

  (print ((paul-acc 'rosebud 'withdraw) 20))

  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))
  (print ((paul-acc 'some-other-password 'deposit) 50))

  (print ((paul-acc 'rosebud 'withdraw) 20))

  (print ((paul-acc 'some-other-password 'deposit) 50))

  (print ((peter-acc 'open-sesame 'withdraw) 20))
  0)
