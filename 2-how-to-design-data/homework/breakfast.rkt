;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname breakfast) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; breakfast.rkt

;; =================
;; Data definitions:

;PROBLEM A:
;
;You want to develop a system that will perfectly heat your breakfast oatmeal.
;
;You have a thermometer that you can stick into the oatmeal. It reads the 
;temperature in whole degrees Celsius.
;
;You are very particular about your oatmeal, and you consider 71 degrees to
;be "just right". Anything less is "too cold" and anything more is "too hot".
;
;Design a data definition to represent the possible oatmeal temperatures.
;
;Call it OatmealTemp.

;; OatmealTemp is one of:
;;  - Natural[0, 71)
;;  - "just right"
;;  - Natural(71, 100]
;; interp. possible oatmeal temperatures in Celsius (71 is ideal)
(define OT1 20)
(define OT2 "just right")
(define OT3 84)

#;
(define (fn-for-oatmeal-temp ot)
  (cond [(and (number? ot) (<= 0 ot) (< ot 71)) (... ot)]
        [(string? ot) (...)]
        [else (... ot)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic non-distinct: Natural[0, 71)
;;  - atomic distinct: "just right"
;;  - atomic non-distinct: Natural(71, 100]



;PROBLEM B:
;
;When you check the temperature of the oatmeal you can adjust the burner on 
;the stove. You can either turn it up, turn it down, or leave it the same.
;
;Design a data definition to represent a stove adjustment.
;
;Call it Adjustment.

;; Adjustment is one of:
;;  - "turn up"
;;  - "turn down"
;;  - "leave same"
;; interp. adjustments to the burner on a stove
;; examples redundant in enumeration

#;
(define (fn-for-adjustment a)
  (cond [(string=? a "turn up") (...)]
        [(string=? a "turn down") (...)]
        [(string=? a "leave same") (...)]))

;; Template rules used:
;;  - one of: 3 cases
;;  - atomic distinct: "turn up"
;;  - atomic distinct: "turn down"
;;  - atomic distinct: "leave same"



;; =================
;; Functions:

;PROBLEM C:
;
;Design a function that will consumes an oatmeal temperature and produces the
;proper stove adjustment based on that temperature.
;
;Call it oatmeal-temp-to-adjustment.

;; OatmealTemp -> Adjustment
;; Produce the appropriate stove adjustment for a given temperature
(check-expect (oatmeal-temp-to-adjustment 20) "turn up")
(check-expect (oatmeal-temp-to-adjustment "just right") "leave same")
(check-expect (oatmeal-temp-to-adjustment 84) "turn down")

;(define (oatmeal-temp-to-adjustment ot) "turn up")   ; stub

;<use template from OatmealTemp>

(define (oatmeal-temp-to-adjustment ot)
  (cond [(and (number? ot) (<= 0 ot) (< ot 71)) "turn up"]
        [(string? ot) "leave same"]
        [else "turn down"]))
