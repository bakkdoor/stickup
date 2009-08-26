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

(define (hello name)
  (let ((message (+ "hello, " name ", wie geht es dir?")))
    (print message)))

(hello "christopher")

(print (string-join '("cool" "yo" "hehe") " "))

(define (pp obj)
  (print (inspect obj)))

(let ((numbers '(1 2 3 4)))
  (print "OK")
  (pp (cons 10 numbers))
  (pp (append '(10 20 30 40) numbers))
  (pp (drop 2 numbers))
  (pp (take 2 numbers)) 
  (if (any? (lambda (x) (> x 2)) numbers)
      (print "there are some greater than 2!")
      (print "there are none greater than 2!")))

(print (rest '(100 200 300 a)))