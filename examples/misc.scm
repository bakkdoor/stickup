;; (let ((numbers (upto 1 20)))
;;   (print (string-concat '("sum of " (inspect numbers) " is:")))
;;   (pp (sum numbers))
;;   (print (string-concat '("product of " (inspect numbers) " is:")))
;;   (pp (product numbers)))

(let* ((x 2)
       (y (* x 4))
       (z (/ (float y) 3)))
  (print- "x: ")
  (print x)
  (print- "y: ")
  (print y)
  (print- "z: ")
  (print z))

(if #t
    (progn
     (print "ok")
     (print "ok2")
     (print "ok3"))
    (print "ohoh"))

(dotimes 10 (lambda (x) (print x)))