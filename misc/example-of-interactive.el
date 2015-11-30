
(defun recordset-calc (which recordset-size)
  "Int -> Int -> Int
Return the start and end record number for a record set
"
  (interactive 
   "nWhich recordset do you want? \nnHow large are your recordsets? ")
  (let* ((start (+ (* (- which 1) recordset-size) 1))
	 (end   (* which recordset-size)))
    (message (format "Start record: %d ... End record: %d" start end))))
