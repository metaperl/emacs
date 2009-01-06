
(defun seconds-to-minutes (seconds)
  "Float -> Float
Convert minutes to hours"
  (interactive)
  (/ seconds 60.0))

(defun seconds-to-hours (seconds)
  "Float -> Float
Convert minutes to hours"
  (interactive)
  (minutes-to-hours (seconds-to-minutes seconds)))


(defun minutes-to-hours (minutes)
  "Float -> Float
Convert minutes to hours"
  (interactive)
  (/ minutes 60.0))

(defun records-per-minute (records minutes)
  "Int -> Float -> Float
Given RECORDS in n MINUTES, return number of records in a minute"
  (/ records minutes))

(defun minutes-for-recordset (records minutes desired-records)
  "Int -> Float -> Int
If you produced m RECORDS in n MINUTES, return how long to produce a
desired number of records"
  (let ((recs-in-a-minute (records-per-minute records minutes)))
    (/ desired-records recs-in-a-minute)))

(defun hours-for-recordset (records minutes desired-records)
  "Int -> Float -> Int
If you produced m RECORDS in n MINUTES, return how many hours to produce a
desired number of records"
  (minutes-to-hours (minutes-for-recordset records minutes desired-records)))

; (records-per-minute 218000 22.5)
; (minutes-for-recordset 218000 22.5 2000000)
; (hours-for-recordset 218000 22.5 2000000)
; (minutes-to-hours 220)
