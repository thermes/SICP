#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
	  (accumulate op initial (cdr sequence)))))

(define (map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) nil sequence))

(define (append seq1 seq2)
  (accumulate cons seq2 seq1))

(define (length sequence)
  (accumulate (lambda (x y) (+ 1 y)) 0 sequence))

(define (main args)
  (define squares (list 1 4 9 16 25))
  (define odds (list 1 3 5 7))

  (print (map abs (list -10 2.5 -11.6 17)))
  (print (map (lambda (x) (* x x))
              (list 1 2 3 4)))

  (print (append squares odds))
  (print (append odds squares))

  (print (length odds))
  0)
