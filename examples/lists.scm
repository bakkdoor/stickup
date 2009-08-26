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