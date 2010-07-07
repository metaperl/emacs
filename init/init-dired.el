;;; dired

(add-hook 'dired-load-hook
	  (lambda ()
	    (require 'dired-x)
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))
(add-hook 'dired-mode-hook
	  (lambda ()
	    ;; Set dired-x buffer-local variables here.  For example:
					;(dired-omit-mode 1)
	    ))
    (setq dired-omit-files-p t)

(setq dired-dwim-target t) 


(provide 'init-dired)