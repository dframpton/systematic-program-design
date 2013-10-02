;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname largest) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; largest.rkt



;; =================
;; Data definitions:

;Remember the data definition for a list of numbers we designed in Lecture 5f:
;(if this data definition does not look familiar, please review the lecture)

;; ListOfNumber is one of:
;;  - empty
;;  - (cons Number ListOfNumber)
;; interp. a list of numbers
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

;PROBLEM:
;
;Design a function that consumes a list of numbers and produces the largest number 
;in the list. If the list is empty, produce 0.

;; ListOfNumber -> Number
;; Produce the largest number from a given list of numbers
(check-expect (largest empty) 0)
(check-expect (largest (cons 5 empty)) 5)
(check-expect (largest (cons 1 (cons 2 (cons 3 empty)))) 3)

;(define (largest lon) 0)   ; stub

(define (largest lon)
  (cond [(empty? lon) 0]
        [else
         (if (> (first lon) (largest (rest lon)))
             (first lon)
             (largest (rest lon)))]))
