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


(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
      (car datum)
      (error "Bad tagged datum -- TYPE-TAG" datum)))

(define (contents datum)
  (if (pair? datum)
      (cdr datum)
      (error "Bad tagged datum -- CONTENTS" datum)))


(define office-1-file '(("foo" "foo-address" 600)
			("bar" "bar-address" 500)
			("baz" "baz-address" 400)))

(define office-2-file '(((name "hoge") (address "hoge-address") (salary 650))
			((name "piyo") (address "piyo-address") (salary 550))
			((name "fuga") (address "fuga-address") (salary 450))))


;; a.
(define (install-office-1-package)
  ;; internal
  (define (get-record name file)
    (cond ((null? file) #f)
	  ((equal? name (get-name (car file))) (car file))
	  (else
	   (get-record name (cdr file)))))
  (define (get-name record)
    (if (null? record)
	(error "no field" record)
	(car record)))
  (define (get-salary record)
    (if (null? record)
	(error "no field" record)
	(caddr record)))

  ;; interface
  (put 'get-record 'office-1 get-record)
  (put 'get-name 'office-1 get-name)
  (put 'get-salary 'office-1 get-salary)
  'done)
(install-office-1-package)

(define tagged-office-1-file
  (attach-tag 'office-1 office-1-file))


(define (install-office-2-package)
  ;; internal
  (define (get-record name file)
    (cond ((null? file) #f)
	  ((equal? name (get-name (car file))) (car file))
	  (else
	   (get-record name (cdr file)))))
  (define (get-name record)
    (cond ((null? record) #f)
	  ((eq? 'name (car (car record)))
	   (cadr (car record)))
	  (else (get-name (cdr record)))))
  (define (get-salary record)
    (cond ((null? record) #f)
	  ((eq? 'salary (car (car record)))
	   (cadr (car record)))
	  (else (get-salary (cdr record)))))

  ;; interface
  (put 'get-record 'office-2 get-record)
  (put 'get-name 'office-2 get-name)
  (put 'get-salary 'office-2 get-salary)
  'done)
(install-office-2-package)

(define tagged-office-2-file
  (attach-tag 'office-2 office-2-file))


(define (get-record name file)
  ((get 'get-record (type-tag file)) name (contents file)))


;; b.
(define (get-info name file get-info)
  (let ((record (get-record name file)))
    (if (eq? record #f) #f
	((get get-info (type-tag file)) record))))

(define (get-name name file)
  (get-info name file 'get-name))
(define (get-salary name file)
  (get-info name file 'get-salary))


;; c.
(define (find-employee-record name office-files)
  (if (null? office-files)
      #f
      (let ((record (get-record name (car office-files))))
	(if (not (eq? record #f))
	    record
	    (find-employee-record name (cdr office-files))))))


(define (main args)
  ;; a.
  (print (get-record "baz" tagged-office-1-file))
  (print (get-record "bar" tagged-office-1-file))
  (print (get-record "foo" tagged-office-1-file))
  (print (get-record "noting" tagged-office-1-file))

  (print (get-record "fuga" tagged-office-2-file))
  (print (get-record "piyo" tagged-office-2-file))
  (print (get-record "hoge" tagged-office-2-file))
  (print (get-record "noting" tagged-office-2-file))

  ;; b.
  (print (get-salary "baz" tagged-office-1-file))
  (print (get-salary "bar" tagged-office-1-file))
  (print (get-salary "foo" tagged-office-1-file))
  (print (get-salary "noting" tagged-office-1-file))

  (print (get-salary "fuga" tagged-office-2-file))
  (print (get-salary "piyo" tagged-office-2-file))
  (print (get-salary "hoge" tagged-office-2-file))
  (print (get-salary "noting" tagged-office-2-file))

  ;; c.
  (print (find-employee-record "baz" (list tagged-office-1-file tagged-office-2-file)))
  (print (find-employee-record "fuga" (list tagged-office-1-file tagged-office-2-file)))
  (print (find-employee-record "nothing" (list tagged-office-1-file tagged-office-2-file)))
  0)
