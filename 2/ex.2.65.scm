#! /usr/bin/env gosh
;;; -*- mode: scheme; coding: utf-8 -*-

(define (intersection-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()    
      (let ((x1 (car set1)) (x2 (car set2)))
        (cond ((= x1 x2)
               (cons x1
                     (intersection-list (cdr set1)
                                       (cdr set2))))
              ((< x1 x2)
               (intersection-list (cdr set1) set2))
              ((< x2 x1)
               (intersection-list set1 (cdr set2)))))))

(define (union-list set1 set2)
  (cond ((null? set1) set2)
	((null? set2) set1)
	(else
	 (let ((x1 (car set1)) (x2 (car set2)))
	   (cond ((= x1 x2)
		  (cons x1
			(union-list (cdr set1)
				   (cdr set2))))
		 ((< x1 x2)
		  (cons x1
			(union-list (cdr set1) set2)))
		 ((< x2 x1)
		  (cons x2
			(union-list set1 (cdr set2)))))))))

(define (entry tree) (car tree))

(define (left-branch tree) (cadr tree))

(define (right-branch tree) (caddr tree))

(define (make-tree entry left right)
  (list entry left right))

(define (element-of-set? x set)
  (cond ((null? set) #f)
	((= x (entry set)) #t)
	((< x (entry set))
	 (element-of-set? x (left-branch set)))
	((> x (entry set))
	 (element-of-set? x (right-branch set)))))

(define (adjoin-set x set)
  (cond ((null? set) (make-tree x '() '()))
	((= x (entry set)) set)
	((< x (entry set))
	 (make-tree (entry set)
		    (adjoin-set x (left-branch set))
		    (right-branch set)))
	((> x (entry set))
	 (make-tree (entry set)
		    (left-branch set)
		    (adjoin-set x (right-branch set))))))

(define (tree->list-1 tree)
  (if (null? tree)
      '()
      (append (tree->list-1 (left-branch tree))
	      (cons (entry tree)
		    (tree->list-1 (right-branch tree))))))

(define (tree->list-2 tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
	result-list
	(copy-to-list (left-branch tree)
		      (cons (entry tree)
			    (copy-to-list (right-branch tree)
					  result-list)))))
  (copy-to-list tree '()))

(define (list->tree elements)
  (car (partial-tree elements (length elements))))

(define (partial-tree elts n)
  (if (= n 0)
      (cons '() elts)
      (let ((left-size (quotient (- n 1) 2)))
	(let ((left-result (partial-tree elts left-size)))
	  (let ((left-tree (car left-result))
		(non-left-elts (cdr left-result))
		(right-size (- n (+ left-size 1))))
	    (let ((this-entry (car non-left-elts))
		  (right-result (partial-tree (cdr non-left-elts)
					      right-size)))
	      (let ((right-tree (car right-result))
		    (remaining-elts (cdr right-result)))
		(cons (make-tree this-entry left-tree right-tree)
		      remaining-elts))))))))

(define (intersection-set set1 set2)
  (list->tree (intersection-list (tree->list-2 set1) (tree->list-2 set2))))

(define (union-set set1 set2)
  (list->tree (union-list (tree->list-2 set1) (tree->list-2 set2))))

(define (main args)
  (define odds (list->tree '(1 3 5 7 9)))
  (define evens (list->tree '(2 4 6 8 10)))
  (define primes (list->tree '(2 3 5 7)))

  (print (intersection-set odds evens))
  (print (intersection-set odds primes))
  (print (intersection-set evens primes))

  (print (union-set odds evens))
  (print (union-set odds primes))
  (print (union-set evens primes))
  0)
