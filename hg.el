(defun hg-add ()

  "perform 'hg add' on the file represented by the current buffer"

  (interactive)
  (let ((shell-command (concat "hg add " (buffer-file-name))))
    (let* ((result (shell-command-to-string shell-command))
	   (result-len (length result)))
      (display-message-or-buffer
       (format 
"
<result>
  <text>%s</text>
  <length>%d</length>
</result>
" result result-len)))))


