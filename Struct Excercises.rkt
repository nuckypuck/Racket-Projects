#lang racket
(struct student (name surname course year) #:mutable)

(define student1 (student "David" "Pearl" "Computing" "Year 1"))

(define searchstudent (λ (x y)
                        (cond
                          ((string=? x "name") (student-name y))
                          ((string=? x "surname") (student-surname y))
                          ((string=? x "course") (student-course y))
                          ((string=? x "year") (student-year y))
                          ((#t) ("error")))))
                        
(define yearupdate (λ (x)
                     (cond
                       ((equal? (student-year x) "Year 1") (set-student-year! x "Year 2"))
                       ((equal? (student-year x) "Year 2") (set-student-year! x "Year 3"))
                       ((equal? (student-year x) "Year 3") (set-student-year! x "Graduated"))
                       ((equal? (student-year x) "Graduated") (set-student-year! x "Graduated")))))
                      




