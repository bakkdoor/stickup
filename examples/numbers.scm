(require "examples/strings")

;; wie can use the hello function from examples/strings
(hello "world!")

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

(pp (even? 5))
(pp (even? 6))
