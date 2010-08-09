; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/b2f12841338f016f#
(defun commify (n &optional comma-char) 


 (unless comma-char (setq comma-char ",")) 

 (with-temp-buffer 
   (insert (format "%s" n)) 
   (while (> (- (point) 
                (line-beginning-position)) 
             (if (>= n 0) 3 4)) 
     (backward-char 3) 
     (insert comma-char) 
     (backward-char 1)) 
   (buffer-string)))

(defmacro if-bound-call (form &rest args)
  "If FORM is bound as a function, call it with ARGS."
  `(if (fboundp ',form)
       (,form ,@args)))

;;; System detection
(defun windows-nt-p ()
  "Test if running a Windows NT version of emacs."
  (eq system-type 'windows-nt))

(defun cygwin-p ()
  "Test if running a Cygwin version of emacs."
  (eq system-type 'cygwin))

(defun macosx-p ()
  "Test if running a MacOS X version of emacs."
  (eq system-type 'darwin))

(defun perltidy ()
  "run perltidy"
  (interactive)
  (shell-command-on-region (point) (mark)
			   "perltidy -q -i=2 -l=140 " nil t))



(provide 'init-functions)