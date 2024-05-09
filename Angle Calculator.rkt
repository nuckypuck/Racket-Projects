#lang racket
(require web-server/servlet
         web-server/servlet-env)


(define (myresponse request)
  ;;we extract the key/value pairs (if present):
  (define bindings (request-bindings request))



(define adder (λ (x y) (cond
                         [(> 180 (+ x y)) (- 180 (+ x y))             
                                          ])))
                         
                

                 
  ;; If there is a first angle key, we print x (after calculation)
  (cond ((exists-binding? 'firstangle bindings)
         (define angle1 (string->number (extract-binding/single 'firstangle bindings)))
         (define angle2 (string->number (extract-binding/single 'secondangle bindings)))
         (define x (adder angle1 angle2))
         (response/xexpr
          `(html (head (title "Triangular Angular Calcangular"))
                 (body
                  (h1 "Triangular Angular Calcangular")
                  (div ((class "name"))
                       (p "Your triangle has has angle A of ",(number->string angle1)", " "B of ",(number->string angle2)" " "and missing angle C of ",(number->string x)))
                  ))))
   (else
    ;; iF there is no "firstangle", we generate a form: 
    (response/xexpr
          `(html (head (title "Triangular Angular Calcangular"))
                 (body
                  (h1 "Triangular Angular Calcangular")
                  (form
                   (input ((name "firstangle")))
                   (input ((name "secondangle")))
                   (input ((type "submit"))))))))
                   

   
   
   )
  )

                   

(serve/servlet myresponse)