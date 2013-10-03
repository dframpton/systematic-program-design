;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname new-numerals) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; new-numerals.rkt

;PROBLEM:
;
;Your friend has just given you a new tablet, and it runs a prototype version of Racket. 
;
;This is great, you can make it do anything. There's just one problem, this version of 
;racket doesn't include numbers as primitive data. There just are no numbers in it!
;
;But you need natural numbers to write your next program.
;
;No problem you say, because you remember the well-formed self-referential data definition 
;for Natural, as well as the idea that add1 is kind of like cons, and sub1 is kind of like
;rest. Your idea is to make add1 actually be cons, and sub1 actually be rest...

;; NATURAL is one of:
;;  - empty
;;  - (cons "!" NATURAL)
;; interp. a natural number, the number of "!" in the list is the number
(define N0 empty)           ; 0
(define N1 (cons "!" N0))   ; 1
(define N2 (cons "!" N1))   ; 2
(define N3 (cons "!" N2))   ; ...
(define N4 (cons "!" N3))
(define N5 (cons "!" N4))
(define N6 (cons "!" N5))
(define N7 (cons "!" N6))
(define N8 (cons "!" N7))
(define N9 (cons "!" N8))

;; These are the primitives that operate on NATURAL:
(define (ZERO? n) (empty? n))     ; Anything    -> Boolean
(define (ADD1  n) (cons "!" n))   ; NATURAL     -> NATURAL
(define (SUB1  n) (rest n))       ; NATURAL[>0] -> NATURAL

#;
(define (fn-for-NATURAL n)
  (cond [(ZERO? n) (...)]
        [else
         (... n
              (fn-for-NATURAL (SUB1 n)))]))



;; NATURAL NATURAL -> NATURAL
;; produce a + b
(check-expect (ADD N2 N0) N2)
(check-expect (ADD N0 N3) N3)
(check-expect (ADD N3 N4) N7)
               
;(define (ADD a b) N0)   ; stub

(define (ADD a b)
  (cond [(ZERO? b) a]
        [else
         (ADD (ADD1 a)
              (SUB1 b))])) ; add 1 to a, take 1 away from b (each time)



;; NATURAL NATURAL -> NATURAL
;; produce a - b
(check-expect (SUBTRACT N2 N0) N2)
(check-expect (SUBTRACT N4 N3) N1)

;(define (SUBTRACT a b) N0)   ; stub

(define (SUBTRACT a b)
  (cond [(ZERO? b) a]
        [else
         (SUBTRACT (SUB1 a)
                   (SUB1 b))])) ; take 1 from b until b becomes 0
