;;;; keypad.lisp

(in-package #:keypad)

(defvar *lookup-table*
 '((#\2 "ABC")
   (#\3 "DEF")
   (#\4 "GHI")
   (#\5 "JKL")
   (#\6 "MNO")
   (#\7 "PQRS")
   (#\8 "TUV")
   (#\9 "WXYZ")))

(defun lookup (char)
  (loop for (number letters) in *lookup-table*
       if (find (char-upcase char) letters) do
       (return number)))

(defun translate (string)
  "Translates string of letters into the corresponding number on a keypad.
Any characters that can't be translated directly are ignored."
  (coerce
   (loop for char across string
      for num = (lookup char)
      if num collect num)
   'string))

