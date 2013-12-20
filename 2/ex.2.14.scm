#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (make-interval a b) (cons a b))

(define (lower-bound a) (min (car a) (cdr a)))

(define (upper-bound a) (max (car a) (cdr a)))

(define (make-center-width c w)
  (make-interval (- c w) (+ c w)))

(define (center i)
  (/ (+ (lower-bound i) (upper-bound i)) 2))

(define (width i)
  (/ (- (upper-bound i) (lower-bound i)) 2))

(define (percent i)
  (* (/ (width i) (center i)) 100.0))

(define (make-center-percent c p)
  (make-center-width c (* c (/ p 100.0))))

(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
		 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
		 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
	(p2 (* (lower-bound x) (upper-bound y)))
	(p3 (* (upper-bound x) (lower-bound y)))
	(p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
		   (max p1 p2 p3 p4))))

(define (new-mul-interval x y)
  (cond ((< 0 (lower-bound x))
	 (cond ((< 0 (lower-bound y))
		(make-interval (* (lower-bound x) (lower-bound y))
			       (* (upper-bound x) (upper-bound y))))
	       ((< (upper-bound y) 0)
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (upper-bound x) (lower-bound y))))
	       (else
		(make-interval (* (upper-bound x) (lower-bound y))
			       (* (upper-bound x) (upper-bound y))))))
	((< (upper-bound x) 0)
	 (cond ((< 0 (lower-bound y))
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (upper-bound x) (lower-bound y))))
	       ((< (upper-bound y) 0)
		(make-interval (* (upper-bound x) (upper-bound y))
			       (* (lower-bound x) (lower-bound y))))
	       (else
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (lower-bound x) (lower-bound y))))))
	(else
	 (cond ((< 0 (lower-bound y))
		(make-interval (* (lower-bound x) (upper-bound y))
			       (* (upper-bound x) (upper-bound y))))
	       ((< (upper-bound y) 0)
		(make-interval (* (upper-bound x) (lower-bound y))
			       (* (lower-bound x) (lower-bound y))))
	       (else
		(make-interval (min (* (lower-bound x) (upper-bound y))
				    (* (upper-bound x) (lower-bound y)))
			       (max (* (lower-bound x) (lower-bound y))
				    (* (upper-bound x) (upper-bound y)))))))))

(define (div-interval x y)
  (if (<= (* (lower-bound y) (upper-bound y)) 0)
      (error "0 error")
      (mul-interval x
		    (make-interval (/ 1.0 (upper-bound y))
				   (/ 1.0 (lower-bound y))))))

(define (par1 r1 r2)
  (div-interval (mul-interval r1 r2)
		(add-interval r1 r2)))

(define (par2 r1 r2)
  (let ((one (make-interval 1 1)))
    (div-interval one
		  (add-interval (div-interval one r1)
				(div-interval one r2)))))

(define (display-interval x)
  (display "[")
  (display (lower-bound x))
  (display ",")
  (display (upper-bound x))
  (display "]")
  (newline))

(define (main args)
  (define r1 (make-center-percent 6.8 10))
  (define r2 (make-center-percent 4.7 5))
  (define i1 (make-center-percent 2 1))
  (define i2 (make-center-percent 1 1))

  (display-interval (par1 r1 r2))
  (display-interval (par2 r1 r2))

  (display-interval (div-interval i1 i1))
  (print (percent (add-interval i1 i2)))
  (print (percent (sub-interval i1 i2)))
  (print (percent (mul-interval i1 i2)))
  (print (percent (div-interval i1 i2)))
)
