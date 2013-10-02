;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname designing-with-lists-1) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; designing-with-lists-1.rkt

;PROBLEM:
;
;You've been asked to design a program having to do with all the owls
;in the owlery.
;
;(A) Design a data definition to represent the weights of all the owls. 
;    For this problem call it ListOfNumber.
;(B) Design a function that consumes the weights of owls and produces
;    the total weight of all the owls.
;(C) Design a function that consumes the weights of owls and produces
;    the total number of owls.



;; =================
;; Data definitions:

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. each number in the list is an owl weight in ounces
(define LON1 empty)
(define LON2 (cons 60 (cons 42 empty)))

#;
(define (fn-for-lon lon)
  (cond [(empty? lon) (...)]
        [else
         (... (first lon)
              (fn-for-lon (rest lon)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Number ListOfNumber)
;;  - self-reference: (rest lon) is ListOfNumber



;; =================
;; Functions:

;; ListOfNumber -> Number
;; Produce total weight of owls in consumed list
(check-expect (sum empty) 0)
(check-expect (sum (cons 60 empty)) (+ 60 0))
(check-expect (sum (cons 60 (cons 42 empty))) (+ 60 (+ 42 0)))

;(define (sum lon) 0)   ; stub

(define (sum lon)
  (cond [(empty? lon) 0]
        [else
         (+ (first lon)
            (sum (rest lon)))]))


;; ListOfNumber -> Number
;; Produce total number of owls in consumed list
(check-expect (total empty) 0)
(check-expect (total (cons 60 empty)) (+ 1 0))
(check-expect (total (cons 60 (cons 42 empty))) (+ 1 (+ 1 0)))

;(define (total lon) 0)   ; stub

(define (total lon)
  (cond [(empty? lon) 0]
        [else
         (+ 1
            (total (rest lon)))]))
