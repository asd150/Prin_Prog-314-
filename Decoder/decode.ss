

; *********************************************
; * final_Arth 314 Principles of Programming Languages  *
; *  Fall 2017                                *
; *  Author: Ulrich Kremer                    *
; *********************************************
;; -----------------------------------------------------
;; ENVIRONMENT
;; contains "ltv", "vtl",and "reduce" definitions
(load "include.ss")

;; contains a test document consisting of three paragraphs. 
(load "document.ss")

;; contains a test-dictionary, which has a much smaller dictionary for testing
;; the dictionary is needed for spell checking
;;(load "test-dictionary.ss")

 (load "dictionary.ss") ;; the real thing with 45,000 words


;; -----------------------------------------------------
;; HELPER FUNCTIONS

;; *** CODE FOR ANY HELPER FUNCTION GOES HERE ***
(define checker
  (lambda (word list)
    (cond
      ((null? list)#f)
      ((equal? word (car list)) #t)
      (else
       (checker word (cdr list))))))
 (define indexfinder
      (lambda (target lst)
        (cond
          ((null? lst) 0)
          ((eq? target (car lst)) 0)
          (else
           (+ 1 (indexfinder target (cdr lst)))))))
(define match
  (lambda (letter)
        (lambda (lis)
          (cond
                ((null? lis) 0)
                        ((eq? letter (car lis))
                             (+ 1 ((match letter) (cdr lis))))
                               (else
                                (+ 0 ((match letter) (cdr lis))))))))

;; -----------------------------------------------------
;; SPELL CHECKER FUNCTION

;;check a word's spell correctness
;;INPUT:a word(a global variable "dictionary" is included in the file "test-dictionary.ss", and can be used directly here)
;;OUTPUT:true(#t) or false(#f)
(define spell-checker 
  (lambda (w)
   'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING *** 
    (checker w dictionary)
    ))





;; -----------------------------------------------------
;; ENCODING FUNCTIONS

;;generate an Caesar Cipher single word encoders
;;INPUT:a number "n"
;;OUTPUT:a function, whose input is a word, and output is the encoded word
(define encode-n
  (lambda (n);;"n" is the distance, eg. n=3: a->d,b->e,...z->c
    (lambda (w);;"w" is the word to be encoded
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
      (map ((lambda (n)
    (lambda (w)
      (vtl ( modulo (+ n (ltv w)) 26)))) n) w)

      )))

;;encode a document
;;INPUT: a document "d" and a "encoder"
;;OUTPUT: an encoded document using a provided encoder
(define encode-d;;this encoder is supposed to be the output of "encode-n"
  (lambda (d encoder)
    'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING **
    (if(null? d) '()
       (append (cons (map encoder (car d)) '()) (encode-d (cdr d) encoder)))
       
    ))




;; -----------------------------------------------------
;; DECODE FUNCTION GENERATORS
;; 2 generators should be implemented, and each of them returns a decoder

;;generate a decoder using brute-force-version spell-checker
;;INPUT:an encoded paragraph "p"
;;OUTPUT:a decoder, whose input=a word, output=decoded word
(define Gen-Decoder-A
  (lambda (p)
    'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***

    (define validWords
      (map (lambda (l)
             (reduce + (map (lambda (a) (if (eq? a #t)1 0)) l) 0))
            (list
             (map spell-checker
                  (map (encode-n 0) p))
             (map spell-checker
                  (map (encode-n 1) p))
             (map spell-checker
                  (map (encode-n 2) p))
             (map spell-checker
                  (map (encode-n 3) p))
             (map spell-checker
                  (map (encode-n 4) p))
             (map spell-checker
                  (map (encode-n 5) p))
             (map spell-checker
                  (map (encode-n 6) p))
             (map spell-checker
                  (map (encode-n 7) p))
             (map spell-checker
                  (map (encode-n 8) p))
             (map spell-checker
                  (map (encode-n 9) p))
             (map spell-checker
                  (map (encode-n 10) p))
             (map spell-checker
                  (map (encode-n 11) p))
             (map spell-checker
                  (map (encode-n 12) p))
             (map spell-checker
                  (map (encode-n 13) p))
             (map spell-checker
                  (map (encode-n 14) p))
             (map spell-checker
                  (map (encode-n 15) p))
             (map spell-checker
                  (map (encode-n 16) p))
             (map spell-checker
                  (map (encode-n 17) p))
             (map spell-checker
                  (map (encode-n 18) p))
             (map spell-checker
                  (map (encode-n 19) p))
             (map spell-checker
                  (map (encode-n 20) p))
             (map spell-checker
                  (map (encode-n 21) p))
             (map spell-checker
                  (map (encode-n 22) p))
             (map spell-checker
                  (map (encode-n 23) p))
             (map spell-checker
                  (map (encode-n 24) p))
             (map spell-checker
                  (map (encode-n 25) p)))
            ))  
    ((lambda (x)
        (encode-n x))
      (indexfinder (apply max validWords) validWords))))

;;generate a decoder using frequency analysis
;;INPUT:same as above
;;OUTPUT:same as above
(define Gen-Decoder-B
  (lambda (p)
    'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***

    (define lcount
      (list 
       (reduce + (map (match 'a)
                      (reduce append (cons p '()) '() )) 0)
       (reduce + (map (match 'b)
                      (reduce append (cons p '()) '() )) 0) 
        (reduce + (map (match 'c)
                       (reduce append (cons p '()) '() )) 0)
        (reduce + (map (match 'd)
                       (reduce append (cons p '()) '() )) 0)
       (reduce + (map (match 'e)
                      (reduce append (cons p '()) '() )) 0)
        (reduce + (map (match 'f)
                       (reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'g)
                        (reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'h)
                        (reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'i)
                        (reduce append (cons  p '()) '() )) 0)
         (reduce + (map (match 'j)(reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'k)
                        (reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'l)
                        (reduce append (cons p '()) '() )) 0)
         (reduce + (map (match 'm)
                        (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'n)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'o)
                         (reduce append (cons p '() )'() )) 0)
          (reduce + (map (match 'p)
                         (reduce append (cons p '() )'() )) 0)
          (reduce + (map (match 'q)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'r)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 's)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 't)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'u)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'v)
                         (reduce append (cons p '()) '() )) 0)
          (reduce + (map (match 'w)
                         (reduce append (cons p '()) '() )) 0)
           (reduce + (map (match 'x)
                          (reduce append (cons p '()) '() )) 0)
            (reduce + (map (match 'y)
                           (reduce append (cons p '()) '() )) 0)
             (reduce + (map (match 'z)
                            (reduce append (cons p '()) '() )) 0)       
       )) 

         (
          (lambda (x)
        (encode-n x))
          (( lambda (p) (+ ( - 26 p) 4))
           (indexfinder (apply max lcount) lcount)
           ))
           
                           
                                
    
    ))
      

;; -----------------------------------------------------
;; CODE-BREAKER FUNCTION

;;a codebreaker
;;INPUT: an encoded document(of course by a Caesar's Cipher), a decoder(generated by functions above)
;;OUTPUT: a decoded document
(define Code-Breaker
  (lambda (d decoder)
     'SOME_CODE_GOES_HERE ;; *** FUNCTION BODY IS MISSING ***
    (cond
      ((null? d) '())
      (else
       (append (cons (map decoder (car d) ) '())
               (Code-Breaker (cdr d) decoder))
    
     ))))

;; -----------------------------------------------------
;; EXAMPLE APPLICATIONS OF FUNCTIONS
;;(spell-checker '(h e l l o))
;;(define add5 (encode-n 5))
;;;(encode-d document add5)
;(define decoderSP1 (Gen-Decoder-B '((c a t)) ))
                  
;;(define decoderFA1 (Gen-Decoder-B paragraph))
;;(Code-Breaker document decoderSP1)

