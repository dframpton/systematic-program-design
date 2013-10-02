;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname rocket) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; rocket.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;You are designing a program to track a rocket's journey as it descends 
;100 kilometers to Earth. You are only interested in the descent from 
;100 kilometers to touchdown. Once the rocket has landed it is done.
;
;Design a data definition to represent the rocket's remaining descent. 
;Call it RocketDescent.

;; RocketDescent is one of:
;;  - Natural(0, 100]
;;  - false
;; interp. false if rocket has landed, otherwise remaining distance in km from Earth
(define RD1 100)
(define RD2  60)
(define RD3   1)
(define RD4 false)

#;
(define (fn-for-rocket-descent rd)
  (cond [(and (number? rd) (< 0 rd) (<= rd 100))
         (... rd)]
        [else
         (...)]))

;; Template rules used:
;;  - one of: 2 cases
;;  - atomic non-distinct: Natural[0, 100]
;;  - atomic distinct: false



;; =================
;; Functions:

;PROBLEM B:
;
;Design a function that will output the rocket's remaining descent distance 
;in a short string that can be broadcast on Twitter. 
;When the descent is over, the message should be "The rocket has landed!".
;Call your function rocket-descent-to-msg.

;; RocketDescent -> String
;; produce a message of the rocket's status, either remaining distance or complete
(check-expect (rocket-descent-to-msg 100) "The rocket has 100km remaining.")
(check-expect (rocket-descent-to-msg  60) "The rocket has 60km remaining.")
(check-expect (rocket-descent-to-msg  false) "The rocket has landed!")

;(define (rocket-descent-to-msg rd) "")   ; stub

;<use template from RocketDescent>

(define (rocket-descent-to-msg rd)
  (cond [(and (number? rd) (< 0 rd) (<= rd 100))
         (string-append "The rocket has " (number->string rd) "km remaining.")]
        [else
         "The rocket has landed!"]))
