;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname editor-project) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))

(require 2htdp/image)
(require 2htdp/universe)

;; editor-project.rkt
;;
;; In this project you will design a simple one line text editor.  
;;
;; The screen looks like:
;; 
;;     abc|def
;;
;; where | is the cursor.
;;
;; Typing a character inserts that character before the cursor.
;; The backspace key deletes the character before the cursor.
;; The left and right arrow keys move the cursor left and right.



;; =================================================================================
;; Constants:

(define WIDTH  200)
(define HEIGHT  20)

(define TEXT-SIZE  18)
(define TEXT-COLOR "BLACK")

(define CURSOR (rectangle 1 20 "solid" "red"))

(define MTS (empty-scene WIDTH HEIGHT))



;; =================================================================================
;; Data Definitions:

(define-struct editor (txt cp))
;; Editor is (make-editor String Natural)
;; interp. the current text (txt) and cursor position (cp) using a 0-based index

(define ED1 (make-editor ""       0)) ; empty
(define ED2 (make-editor "abcdef" 0)) ; cursor at beginning as in |abcdef
(define ED3 (make-editor "abcdef" 3)) ; cursor in middle of text as in abc|def
(define ED4 (make-editor "abcdef" 6)) ; cursor at end as in abcdef|

#;
(define (fn-for-editor e)
  (... (editor-txt e)
       (editor-cp e)))



;; =================================================================================
;; Functions:

;; Editor -> Editor
;; start the world with an initial state e, for example (main (make-editor "" 0))
(define (main e)
  (big-bang e
            (to-draw    render)         ; Editor -> Image
            (on-key     handle-key)))   ; Editor KeyEvent -> Editor



;; Editor -> Image
;; place text with cursor at left, middle edge of MTS
(check-expect (render (make-editor "abcdef" 3))
              (overlay/align "left"
                             "middle"
                             (beside (text "abc" TEXT-SIZE TEXT-COLOR)
                                     CURSOR
                                     (text "def" TEXT-SIZE TEXT-COLOR))
                             MTS))

;(define (render e) MTS) ;stub

(define (render e)
  (overlay/align "left"
                 "middle"
                 (beside (text (substring (editor-txt e) 0 (editor-cp e))
                               TEXT-SIZE
                               TEXT-COLOR)
                         CURSOR
                         (text (substring (editor-txt e) (editor-cp e))
                               TEXT-SIZE
                               TEXT-COLOR))
                 MTS))



;; Editor KeyEvent -> Editor
;; call appropriate function for each keyboard command
;; more thorough test cases for each key in helper functions
(check-expect (handle-key (make-editor "abcdef" 3) "left") (make-editor "abcdef" 2))
(check-expect (handle-key (make-editor "abcdef" 2) "right") (make-editor "abcdef" 3))
(check-expect (handle-key (make-editor "abcdef" 4) "\b") (make-editor "abcef" 3))
(check-expect (handle-key (make-editor "abcdef" 1) "z") (make-editor "azbcdef" 2))
(check-expect (handle-key (make-editor "abcdef" 5) "shift") (make-editor "abcdef" 5))

;(define (handle-key e key) e) ;stub

(define (handle-key e key)
  (cond [(key=? key "left")        (move-cursor-left e)]
        [(key=? key "right")       (move-cursor-right e)]
        [(key=? key "\b")          (backspace e)]        
        [(= (string-length key) 1) (insert e key)]
        [else e]))



;; Editor -> Editor
;; move cursor one character to the left
(check-expect (move-cursor-left (make-editor "abcdef" 3)) (make-editor "abcdef" 2))
(check-expect (move-cursor-left (make-editor "abcdef" 0)) (make-editor "abcdef" 0))

;(define (move-cursor-left e) e)   ; stub

(define (move-cursor-left e)
  (if (> (editor-cp e) 0)
      (make-editor (editor-txt e)
                   (- (editor-cp e) 1))
      e))



;; Editor -> Editor
;; move cursor one character to the right
(check-expect (move-cursor-right (make-editor "abcdef" 3)) (make-editor "abcdef" 4))
(check-expect (move-cursor-right (make-editor "abcdef" 6)) (make-editor "abcdef" 6))

;(define (move-cursor-right e) e)   ; stub

(define (move-cursor-right e)
  (if (< (editor-cp e) (string-length (editor-txt e)))
      (make-editor (editor-txt e)
                   (+ (editor-cp e) 1))
      e))



;; Editor -> Editor
;; delete character to the left of the cursor
(check-expect (backspace (make-editor "abcdef" 3)) (make-editor "abdef" 2))
(check-expect (backspace (make-editor "abcdef" 1)) (make-editor "bcdef" 0))
(check-expect (backspace (make-editor "abcdef" 0)) (make-editor "abcdef" 0))

;(define (backspace e) e)   ; stub

(define (backspace e)
  (if (> (editor-cp e) 0)
      (make-editor (remove-char (editor-txt e) (editor-cp e))
                   (- (editor-cp e) 1))
      e))



;; Editor KeyEvent -> Editor
;; insert the given character to the left of the cursor
(check-expect (insert (make-editor "abcdef" 0) "z") (make-editor "zabcdef" 1))
(check-expect (insert (make-editor "abcdef" 6) "z") (make-editor "abcdefz" 7))
(check-expect (insert (make-editor "abcdef" 3) "z") (make-editor "abczdef" 4))

;(define (insert e key) e)   ; stub

(define (insert e key)
  (make-editor (add-char (editor-txt e) key (editor-cp e))
               (+ (editor-cp e) 1)))



;; String String Natural -> String
;; produce a new string with the added single character at position Natural
;; helper function to (insert e key)
(check-expect (add-char "abcdef" "z" 0) "zabcdef")
(check-expect (add-char "abcdef" "z" 6) "abcdefz")
(check-expect (add-char "abcdef" "z" 3) "abczdef")

;(define (add-char s1 s2 i) "")   ; stub

(define (add-char s1 s2 i)
  (string-append (substring s1 0 i)
                 s2
                 (substring s1 i)))



;; String Natural -> String
;; produce a new string with the character at position (- Natural 1) removed
;; helper function to (backspace e)
(check-expect (remove-char "abcdef" 0) "abcdef")
(check-expect (remove-char "abcdef" 3) "abdef")
(check-expect (remove-char "abcdef" 6) "abcde")

;(define (remove-char s i) "")   ; stub

(define (remove-char s i)
  (if (> i 0)
      (string-append (substring s 0 (- i 1))
                     (substring s i))
      s))
