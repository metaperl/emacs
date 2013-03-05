(setq-default tramp-default-method "ssh")
					;(setq tramp-default-method "scp")
					;(setq tramp-default-method "rsync")

; (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))


(defconst my-mode-line-buffer-identification
  (list
   '(:eval
     (let ((host-name
	    (if (file-remote-p default-directory)
		(tramp-file-name-host
		 (tramp-dissect-file-name default-directory))
	      (system-name))))
       (if (string-match "^[^0-9][^.]*\\(\\..*\\)" host-name)
	   (substring host-name 0 (match-beginning 1))
	 host-name)))
   ": %12b"))

(setq-default
 mode-line-buffer-identification
 my-mode-line-buffer-identification)

(add-hook
 'dired-mode-hook
 '(lambda ()
    (setq
     mode-line-buffer-identification
     my-mode-line-buffer-identification)))


(setq tramp-default-proxies-alist nil)

(setq password-cache-expiry nil)

(require 'tramp)

; (add-to-list 'tramp-remote-path "/usr/bsd")
; (add-to-list 'load-path "~/emacs/contrib/tramp/lisp")
; (setq tramp-verbose 1)
; (setq tramp-verbose 6)
; (tramp-cleanup-all-connections)
; (setcdr (assoc 'tramp-remote-sh (assoc "ssh" tramp-methods)) '("/bin/bash"))

(provide 'init-tramp)
