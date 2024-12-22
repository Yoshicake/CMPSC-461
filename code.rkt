#lang racket/base
; Problem 1
(define (calculateFare start end)
  (define city-zones '(("Times Square" 1) ("Grand Central" 1) ("Williamsburg" 2) ("Astoria" 2) ("Bronx Zoo" 3) ("Staten Island Terminal" 3)
  ))
  (define start-zone (car (cdr (assoc start city-zones))))
  (define end-zone (car (cdr (assoc end city-zones))))
  (cond ((= start-zone end-zone) 2.5) ; same zone fare
        ((= (+ start-zone end-zone) 3) 3.5) ; zone 1 and 2 fare
        ((= (+ start-zone end-zone) 4) 4.5) ; zone 1 and 3 fare
        ((= (+ start-zone end-zone) 5) 3) ; zone 2 and 3 fare
        )
  
)      


; Problem 2.1
(define (playlist-duration songLengths repeatCounts)
(cond
      ((and (null? songLengths) (null? repeatCounts)) '()) ; both lists are empty

      ((null? songLengths)  (cons 0 (playlist-duration '() (cdr repeatCounts)))) ; songLengths is empty

      ((null? repeatCounts)  (cons (car songLengths) (playlist-duration (cdr songLengths) '()))) ; songLengths is empty

      (else (cons (* (car songLengths) (car repeatCounts)) (playlist-duration (cdr songLengths) (cdr repeatCounts)))) ; both lists contain at least 1 element
      
))

; Problem 2.2
(define (cumulative-playlist-duration songDurations)
    ; helper function
    (define (calculateSum durations sum)
        (cond
              ((null? durations) '()) ; no more songs

              ((>= (+ sum (car durations)) 1000) (list 1000)) ; duration is longer than or equal to 1000

              (else (cons (+ sum (car durations)) (calculateSum (cdr durations) (+ sum (car durations))))) ; duration less than 1000
               
        )
    )
(calculateSum songDurations 0)
)


; Problem 3.1
(define (flatten-subtract-triple lst)
      (define (flatten list)
        (cond
          ((null? list) '()) ; list becomes empty
          
          ((list? (car list)) (append (flatten (car list)) (flatten (cdr list)))) ; if the element looked at is a list
          
          (else (cons (car list) (flatten (cdr list)))) ; element looked at is just a number
        )
      )

      (define (subtract-triple x) ; applies transformation
        (* 3 (- x 1))
      )

      (map subtract-triple (flatten lst)) ; helper call
        

)


; Problem 3.2
(define (conditional-cumulative-sum lst)
      (define (cumulative-sum list sum)
        (cond
          ((null? list) '()) ; list is empty

          (else
               (let* ((next-sum (+ sum (car list)))
                     (actual-sum (if (even? next-sum) (* 2 next-sum) next-sum))) ; checks if sum is even
               (cons actual-sum (cumulative-sum (cdr list) actual-sum))) ; recursive call
                
          )

         )

      )
      (cumulative-sum lst 0) ; helper call


)


; Problem 4.1
(define (interleave-duplicates lst)
  (cond
    ((null? lst) '()) ; base case

    ((number? (car lst)) (cons (car lst) (cons (car lst) (interleave-duplicates (cdr lst))))) ; if element is a number

    (else (cons (car lst) (interleave-duplicates (cdr lst)))) ; if element is not a number

  )

)



; Problem 4.2
(define (nested-sum lst)
  (cond

  ((null? lst) 0) ; base case
  
  ((list? (car lst)) (+ (nested-sum (car lst)) (nested-sum (cdr lst)))) ; if next element is a list
  
  ((number? (car lst)) (+ (car lst) (nested-sum (cdr lst)))) ; if next element is a number

  (else (nested-sum (cdr lst))) ; if next element (within a sublist if needed) is not a number

  )
)



