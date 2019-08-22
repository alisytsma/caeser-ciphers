;Lisp

;shift character a shiftAmount number of times
(defun shift(char shiftAmount)
    ;if not whitespace, shift
    (if (= (char-code char) 32) (code-char 32)
        (code-char (+ (mod (+ (- (char-code char) 65) shiftAmount) 26) 65))))
 
;encrypt a string
(defun encrypt (str shiftAmount)
    (map 'string #'(lambda (c) (shift c shiftAmount)) (string-upcase str)))
 
;decrypt a string by sending the negative of the shiftAmount to encrypt
(defun decrypt (str shiftAmount) (encrypt str (- shiftAmount)))

;function to print all encryptions of a string
(defun solve(str maxShiftAmount)
	(loop for i from 0 to maxShiftAmount
        for temp = (format t "Caesar ~d: ~A~C" i (encrypt str i) #\return)))
 
;output
(let* ((origStr "It is treason then")
        (shiftAmount 12)
        (encStr (encrypt origStr shiftAmount)))
    (format t " Original String: ~a ~%" origStr)
    (format t "Encrypted String: ~a ~%" encStr)
    (format t "Decrypted String: ~a ~%" (decrypt encStr shiftAmount))
    (format t "Solve:" )
    (solve encStr 25)
)
