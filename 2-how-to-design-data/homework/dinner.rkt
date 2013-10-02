;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname dinner) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; dinner.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;You are working on a system that will automate delivery for 
;YesItCanFly! airlines catering service. 
;There are three dinner options for each passenger, chicken, pasta 
;or no dinner at all. 
;
;Design a data definition to represent a dinner order. Call the type 
;DinnerOrder.

;; DinnerOrder is one of:
;;  - "Chicken"
;;  - "Pasta"
;;  - "No dinner"
;; interp. dinner options for each passenger
;; Examples are redundant for enumerations

#;
(define (fn-for-dinner-order d)
  (cond [(string=? d "Chicken") (...)]
        [(string=? d "Pasta") (...)]
        [(string=? d "No dinner") (...)]))

;; Template rules used:
;; - one-of: 3 cases
;; - atomic distinct: "Chicken"
;; - atomic distinct: "Pasta"
;; - atomic distinct: "No dinner"



;; =================
;; Functions:

;PROBLEM B:
;
;Design the function dinner-order-to-msg that consumes a dinner order 
;and produces a message for the flight attendants saying what the
;passenger ordered. 
;
;For example, calling dinner-order-to-msg for a chicken dinner would
;produce "The passenger ordered chicken."

;; DinnerOrder -> String
;; Produce a message saying what the passenger order
(check-expect (dinner-order-to-msg "Chicken") "The passenger ordered chicken.")
(check-expect (dinner-order-to-msg "Pasta") "The passenger ordered pasta.")
(check-expect (dinner-order-to-msg "No dinner") "The passenger didn't order dinner.")

;(define (dinner-order-to-msg d) "")   ; stub

;<use template from DinnerOrder>

(define (dinner-order-to-msg d)
  (cond [(string=? d "Chicken") "The passenger ordered chicken."]
        [(string=? d "Pasta") "The passenger ordered pasta."]
        [(string=? d "No dinner") "The passenger didn't order dinner."]))
