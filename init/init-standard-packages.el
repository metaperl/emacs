;;; TRAMP

(require 'tramp)
;(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

;(setq tramp-default-method "ssh")
;(setq tramp-default-method "rsync")



;;; uniquify

(require 'uniquify)
;(setq uniquify-buffer-name-style 'reverse)
;(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward)
;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; shell access

(setq comint-buffer-maximum-size 20000)
(ansi-color-for-comint-mode-on)


;;; cperl-mode is preferred to perl-mode                                        

(defalias 'perl-mode 'cperl-mode)




;(setq explicit-shell-file-name "bash")
(require 'shell-current-directory)
(global-set-key (kbd "<f9>") 'shell-current-directory)
(require 'comint)
(add-to-list 'comint-output-filter-functions 'comint-truncate-buffer)




(add-hook 'text-mode-hook 'turn-on-auto-fill t)

;;; latex

(add-hook 'latex-mode-hook 'turn-on-auto-fill t)
(setq latex-run-command "pdflatex")


;; ido

(require 'ido)
(ido-mode t)

(setq ido-default-file-method 'selected-window)
(setq ido-default-buffer-method 'selected-window) 

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

;; desktop

(require 'desktop)
(setq desktop-save t)
(setq desktop-dirname "~/.emacs.d/")
(desktop-save-mode 1)
(setq desktop-restore-eager 3)
(add-to-list 'desktop-globals-to-save 'file-name-history)


;; bookmark

(setq-default bookmark-default-file "~/emacs/bmk.el")

(provide 'init-standard-packages)
