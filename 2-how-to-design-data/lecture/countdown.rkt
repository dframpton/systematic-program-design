;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname countdown) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; countdown.rkt

;PROBLEM:
;
;Consider designing the system for controlling a New Year's Eve
;display. Design a data definition to represent the current state 
;of the countdown, which falls into one of three categories: 
;
; - not yet started
; - from 10 to 1 seconds before midnight
; - complete (Happy New Year!)



;; CountDown is one of:
;;  - false
;;  - Natural[1, 10]
;;  - "complete"
;; interp.
;;    false means countdown has not yet started
;;    Natural[1, 10] means countdown is running and how many seconds left
;;    "complete" means countdown is over
(define CD1 false)
(define CD2 10)   ;just started running
(define CD3  1)   ;almost over
(define CD4 "complete")

#;
(define (fn-for-countdown cd)
  (cond [(false? cd) (...)]
        [(and (number? cd) (<= 1 cd) (<= cd 10)) (... cd)]
        [else (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: false
;;  - atomic non-distinct: Natural[1, 10]
;;  - atomic distinct: "complete"
