#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-vect x y)
  (cons x y))

;; list
(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-frame frame)
  (car frame))

(define (edge1-frame frame)
  (car (cdr frame)))

(define (edge2-frame frame)
  (car (cdr (cdr frame))))

;; cons
;; (define (make-frame origin edge1 edge2)
;;   (cons origin (cons edge1 edge2)))

;; (define (origin-frame frame)
;;   (car frame))

;; (define (edge1-frame frame)
;;   (car (cdr frame)))

;; (define (edge2-frame frame)
;;   (cdr (cdr frame)))

(define (main args)
  (define v_origin (make-vect 1 3))
  (define v_edge1 (make-vect 2 6))
  (define v_edge2 (make-vect 3 9))
  (define frame (make-frame v_origin v_edge1 v_edge2))

  (print frame)
  (print (origin-frame frame))
  (print (edge1-frame frame))
  (print (edge2-frame frame))
  0)
