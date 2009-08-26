(define (fact x)
  (if (= x 0)
      1
      (* x (fact (- x 1)))))

(print (fact 6))

(define (add x)
  (lambda (y)
    (+ x y)))

(define add4 (add 4))
(define add5 (add 5))

(print (add4 3))
(print (add5 3))

(let ((a 5)
      (b 2))
  (print a)
  (print b)
  (set a 9)
  (print a))

(define (reduce fn base-value lis)
  (if (empty? lis)
      base-value
      (fn (car lis)
	  (reduce fn base-value (cdr lis)))))


(define (string-concat words)
  (reduce (lambda (x y) (+ x y)) "" words))

(define (string-join words join-string)  
  (let ((words-with-join-string (map (lambda (word) (+ word join-string)) 
				     words)))
    (string-concat words-with-join-string)))

(define (hello name)
  (let ((message (+ "hello, " name ", wie geht es dir?")))
    (print message)))

(hello "christopher")

(print (string-join (list "cool" "yo" "hehe") " "))