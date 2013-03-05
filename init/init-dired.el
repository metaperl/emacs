;;; dired

(add-hook 'dired-load-hook
	  (lambda ()
	    (require 'dired-x)
	    ;; Set dired-x global variables here.  For example:
	    ;; (setq dired-guess-shell-gnutar "gtar")
	    ;; (setq dired-x-hands-off-my-keys nil)
	    ))

;; (add-hook 'dired-mode-hook
;; 	  (lambda ()
;; 	    ;; Set dired-x buffer-local variables here.  For example:
;; 					;(dired-omit-mode 1)
;; 	    ))
;;     (setq dired-omit-mode t)

(setq dired-omit-mode nil)

(setq dired-dwim-target t)


(provide 'init-dired)
