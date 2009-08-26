(define (string-concat words)
  (reduce (lambda (x y) (+ x y)) "" words))

(define (string-join words join-string)  
  (let ((words-with-join-string (map (lambda (word) (+ word join-string)) 
				     words)))
    (string-concat words-with-join-string)))
