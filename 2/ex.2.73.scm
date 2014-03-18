#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define *global-array* '())

(define (make-entry k v) (list k v))
(define (key entry) (car entry))
(define (value entry) (cadr entry))

(define (put op type item)
  (define (put-helper k array)
    (cond ((null? array) (list (make-entry k item)))
          ((equal? (key (car array)) k) array)
          (else (cons (car array) (put-helper k (cdr array))))))
  (set! *global-array* (put-helper (list op type) *global-array*)))

(define (get op type)
  (define (get-helper k array)
    (cond ((null? array) #f)
          ((equal? (key (car array)) k) (value (car array)))
          (else (get-helper k (cdr array)))))
  (get-helper (list op type) *global-array*))


(define (=number? exp num)
  (and (number? exp) (= exp num)))

(define (variable? x) (symbol? x))

(define (same-variable? v1 v2)
  (and (variable? v1) (variable? v2) (eq? v1 v2)))

(define (deriv exp var)
  (cond ((number? exp) 0)
	((variable? exp) (if (same-variable? exp var) 1 0))
	(else ((get 'deriv (operator exp)) (operands exp) var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))

;; a.
;; not yet.

;; b.
(define (make operator exp1 exp2)
  ((get 'make operator) exp1 exp2))

(define (install-sum-package)
  ;; internal
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
	  ((=number? a2 0) a1)
	  ((and (number? a1) (number? a2)) (+ a1 a2))
	  (else (list '+ a1 a2))))
  (define (addend s) (car s))
  (define (augend s) (cadr s))
  (define (deriv-sum exp var)
    (make '+
      (deriv (addend exp) var)
      (deriv (augend exp) var)))

  ;; interface
  (put 'deriv '+ deriv-sum)
  (put 'make '+ make-sum)
  'done)
(install-sum-package)

(define (install-product-package)
  ;; internal
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
	  ((=number? m1 1) m2)
	  ((=number? m2 1) m1)
	  ((and (number? m1) (number? m2)) (* m1 m2))
	  (else (list '* m1 m2))))
  (define (multiplier p) (car p))
  (define (multiplicand p) (cadr p))

  (define (deriv-product exp var)
    (make '+
      (make '*
	(multiplier exp)
	(deriv (multiplicand exp) var))
      (make '*
	(deriv (multiplier exp) var)
	(multiplicand exp))))

  ;; interface
  (put 'deriv '* deriv-product)
  (put 'make '* make-product)
  'done)
(install-product-package)

(define (install-exponentiation-package)
  ;; internal
  (define (make-exponentiation u n)
    (cond ((=number? n 0) 1)
	  ((=number? n 1) u)
	  (else (list '** u n))))
  (define (base e) (car e))
  (define (exponent e) (cadr e))

  (define (deriv-exponentiation exp var)
    (make '*
      (make '*
	(exponent exp)
	(make '** (base exp) (make '+ (exponent exp) -1)))
      (deriv (base exp) var)))

  ;; interface
  (put 'deriv '** deriv-exponentiation)
  (put 'make '** make-exponentiation)
  'done)
(install-exponentiation-package)

;; d
;; not yet.

(define (main args)
  (print (deriv '(+ x 3) 'x))
  (print (deriv '(* x y) 'x))
  (print (deriv '(* (* x y) (+ x 3)) 'x))

  (print (deriv '(** x -1) 'x))
  (print (deriv '(** x 0) 'x))
  (print (deriv '(** x 1) 'x))
  (print (deriv '(** x 2) 'x))
  (print (deriv '(** x 3) 'x))
  (print (deriv '(** x 4) 'x))

  (print (deriv '(** x (+ 1 1)) 'x))

  (print (deriv '(** (* x 3) 2) 'x))
  (print (deriv '(* 9 (** x 2)) 'x))
  0)
