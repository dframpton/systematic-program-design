;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-reader.ss" "lang")((modname evaluate-boo) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

;; evaluate-boo.rkt

;Given the following function definition:
;
;(define (boo x lon)
;  (local [(define (addx n) (+ n x))]
;    (if (zero? x)
;        empty
;        (cons (addx (first lon))
;              (boo (sub1 x) (rest lon))))))



;PROBLEM A:
;
;What is the value of the following expression:
;
;(boo 2 (list 10 20))
;
;NOTE: We are not asking you to show the full step-by-step evaluation for 
;this problem, but you may want to sketch it out to help you get these 
;questions right.

(define (boo x lon)
  (local [(define (addx n) (+ n x))]
    (if (zero? x)
        empty
        (cons (addx (first lon))
              (boo (sub1 x) (rest lon))))))

(boo 2 (list 10 20))

(local [(define (addx n) (+ n 2))]
  (if (zero? 2)
      empty
      (cons (addx (first (list 10 20)))
            (boo (sub1 2) (rest (list 10 20))))))

(define (addx_0 n) (+ n 2))   ; rename, lift, replace

(if (zero? 2)
    empty
    (cons (addx_0 (first (list 10 20)))
          (boo (sub1 2) (rest (list 10 20)))))

(if false
    empty
    (cons (addx_0 (first (list 10 20)))
          (boo (sub1 2) (rest (list 10 20)))))

(cons (addx_0 (first (list 10 20)))
      (boo (sub1 2) (rest (list 10 20))))

(cons (addx_0 10)
      (boo (sub1 2) (rest (list 10 20))))

(cons (+ 10 2)
      (boo (sub1 2) (rest (list 10 20))))

(cons 12
      (boo (sub1 2) (rest (list 10 20))))

(cons 12
      (boo 1 (rest (list 10 20))))

(cons 12
      (boo 1 (list 20)))

(local [(define (addx n) (+ n 1))]
  (if (zero? 1)
      empty
      (cons (addx (first (list 20)))
            (boo (sub1 1) (rest (list 20))))))

(define (addx_1 n) (+ n 1))   ; rename, lift, replace

(if (zero? 1)
    empty
    (cons (addx_1 (first (list 20)))
          (boo (sub1 1) (rest (list 20)))))

(if false
    empty
    (cons (addx_1 (first (list 20)))
          (boo (sub1 1) (rest (list 20)))))

(cons (addx_1 (first (list 20)))
      (boo (sub1 1) (rest (list 20))))

(cons (addx_1 20)
      (boo (sub1 1) (rest (list 20))))

(cons (+ 20 1)
      (boo (sub1 1) (rest (list 20))))

(cons 21
      (boo (sub1 1) (rest (list 20))))

(cons 21
      (boo 0 (rest (list 20))))

(cons 21
      (boo 0 empty))

(local [(define (addx n) (+ n 0))]
  (if (zero? 0)
      empty
      (cons (addx (first empty))
            (boo (sub1 0) (rest empty)))))

(define (addx_2 n) (+ n 0))   ; rename, lift, replace

(if (zero? 0)
    empty
    (cons (addx_2 (first empty))
          (boo (sub1 0) (rest empty))))

(if true
    empty
    (cons (addx_2 (first empty))
          (boo (sub1 0) (rest empty))))

(cons 12 (cons 21 empty))

(cons 12 (list 21))

(list 12 21)



;PROBLEM B:
;
;How many function definitions are lifted during the evaluation of the 
;expression in part A.

;; 3



;PROBLEM C:
;
;Write out the lifted function definition(s). Just the actual lifted function 
;definitions.

;; (define (addx_0 n) (+ n 2))
;; (define (addx_1 n) (+ n 1))
;; (define (addx_2 n) (+ n 0))
