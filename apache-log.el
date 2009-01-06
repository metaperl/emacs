(setq debug-on-error t)

(defvar apache-log-revision "$Revision: 1.2 $")

(defvar *apache-log-line-regexp* "\\s-\\(\\S-+\\) line \\([0-9]+\\)"
  "A regexp to extract FILE and LINENO from a line of an Apache log file.       
Currently setup to work with Perl output")


(defvar *apache-log-file* "/var/log/apache2/error.log"
  "The absolute path to the apache error log")

(defun apache-log-version ()
  (interactive)
  (message apache-log-revision))


(defun apache-log-tail ()
  (interactive)
  (apache-log-tail-internal *apache-log-file*))

(defun apache-log-tail-internal (file &optional lines)
  "Display a buffer of FILE, showing the last LINES.                            
                                                                                
Optional prefix arg, LINES is the number of lines to display.  It is            
the value to give to tail's `-n' switch."
  (interactive "f\nP")
  (let* ((buf (get-buffer-create (format "*%s-log*" file)))
         (lines (or current-prefix-arg
                    300))
         (str (shell-command-to-string
               (format "tail -n%s %s" lines file))))
    (switch-to-buffer buf)
    (setq buffer-read-only nil)
    (erase-buffer)
    (insert str)
    (setq buffer-read-only t)
    (goto-char (point-max))))

(defun apache-log-find-file-goto-line (file line)
  (find-file-other-window file)
  (goto-line line))

(defun apache-log-find-file ()
  (interactive)
  (beginning-of-line)
  (let* ((start (point))
         (eol   (end-of-line))
         (str   (buffer-substring start (point) (current-buffer))))
    (if (string-match *apache-log-line-regexp* str)
        (let ((file   (match-string 1 str))
              (lineno (read (match-string 2 str))))
          (apache-log-find-file-goto-line file lineno))
      (message "Cannot parse line"))))




(provide 'apache-log)

(setq debug-on-error t)