;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname boolean-list) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; boolean-list.rkt



;; =================
;; Data definitions:

;PROBLEM A:
;
;Design a data definition to represent a list of booleans. Call it ListOfBoolean.

;; ListOfBoolean is one of:
;;  - empty
;;  - (cons Boolean ListOfBoolean)
;; interp. a list of booleans
(define LOB1 empty)
(define LOB2 (cons true (cons false (cons false empty))))

#;
(define (fn-for-lob lob)
  (cond [(empty? lob) (...)]
        [else
         (... (first lob)
              (fn-for-lob (rest lob)))]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic distinct: empty
;;  - compound: (cons Boolean ListOfBoolean)
;;  - self-reference: (rest lob) is ListOfBoolean



;; =================
;; Functions:

;PROBLEM B:
;
;Design a function that consumes a list of boolean values and produces true 
;if every value in the list is true. If the list is empty, your function 
;should also produce true. Call it all-true?

;; ListOfBoolean -> Boolean
;; Produce true if every value in the given list is true
(check-expect (all-true? empty) true)
(check-expect (all-true? (cons true empty)) true)
(check-expect (all-true? (cons true (cons false empty))) false)
(check-expect (all-true? (cons true (cons true (cons true empty)))) true)

;(define (all-true? lob) false)   ; stub

(define (all-true? lob)
  (cond [(empty? lob) true]
        [else
         (and (first lob)
              (all-true? (rest lob)))]))
