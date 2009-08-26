(define (hello name)
  (let ((message (+ "hello, " name ", wie geht es dir?")))
    (print message)))

(hello "christopher")

(print (string-join '("cool" "yo" "hehe") " "))
