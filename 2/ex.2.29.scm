#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define nil (list))

(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

;; a.
(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (car (cdr mobile)))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (car (cdr branch)))

(define (mobile? branch)
  (pair? (car (cdr branch))))

(define (weight? branch)
  (not (mobile? branch)))
  ;; (not (pair? (car (cdr branch)))))

(define (branch-weight branch)
  (let ((structure (branch-structure branch)))
    (if (weight? branch)
	structure
	(total-weight structure))))

;; b.
(define (total-weight mobile)
  (+ (branch-weight (left-branch mobile))
     (branch-weight (right-branch mobile))))

;; c.
(define (branch-torque branch)
  (* (branch-length branch)
     (branch-weight branch)))

(define (balanced? mobile)
  (define (branch-baranced? branch)
    (if (mobile? branch)
	(balanced? (branch-structure branch))
	#t))
  (let ((lb (left-branch mobile))
	(rb (right-branch mobile)))
    (and (= (branch-torque lb)
	    (branch-torque rb))
	 (branch-baranced? lb)
	 (branch-baranced? rb))))

(define (main args)
  (define mobile1
    (make-mobile
     (make-branch 2 3)
     (make-branch 2 4)))

  (define mobile2
    (make-mobile
     (make-branch 5 (make-mobile
		     (make-branch 2 3)
		     (make-branch 3 5)))
     (make-branch 10 4)))

  (define mobile3
    (make-mobile
     (make-branch 2 (make-mobile
		     (make-branch 1 4)
		     (make-branch 2 2)))
     (make-branch 3 4)))

  (print (total-weight mobile1))
  (print (total-weight mobile2))
  (print (total-weight mobile3))
		   
  (print (balanced? mobile1))
  (print (balanced? mobile2))
  (print (balanced? mobile3))
  0)
