					; (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))
(setq-default tramp-default-method "ssh")
					;(setq tramp-default-method "scp")
					;(setq tramp-default-method "rsync")
					;(setcdr (assoc 'tramp-remote-sh (assoc "ssh" tramp-methods)) '("/bin/bash"))


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

(add-to-list 'tramp-default-proxies-alist '("afm.boca.verio.net" nil "/root@aim.boca.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("aim.boca.verio.net" nil "/t.brannon@jump0.wh.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("alm.boca.verio.net" nil "/root@aim.boca.verio.net:"))

(add-to-list 'tramp-default-proxies-alist '("app95a.boca95-verio.com" nil "/root@txn95.boca95-verio.com:"))
(add-to-list 'tramp-default-proxies-alist '("txn95.boca95-verio.com" nil "/t.brannon@jump0.wh.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("txn96.sterling96-verio.com" nil "/tbrannon@zuul.boca.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("mnb9600.sterling96-verio.com" nil "/t.brannon@jump0.wh.verio.net:"))


(add-to-list 'tramp-default-proxies-alist '("dev2.boca.verio.net" nil "/tbrannon@zuul.boca.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("nimbus2.securesites.net" nil "/root@nm.vwh.net:"))
(add-to-list 'tramp-default-proxies-alist '("zuul.boca.verio.net" nil "/t.brannon@jump0.wh.verio.net:"))

(add-to-list 'tramp-default-proxies-alist '("mmm9500.boca95-verio.com" nil "/t.brannon@jump0.wh.verio.net:"))
(add-to-list 'tramp-default-proxies-alist '("mmm9502.boca95-verio.com" nil "/t.brannon@jump0.wh.verio.net:"))

					;(add-to-list 'tramp-default-proxies-alist
					;	     '("boca95-verio.com" nil "/scp:t.brannon@jump0.wh.verio.net:"))
					;(setq tramp-verbose 6)

(setq password-cache-expiry nil)


; (add-to-list 'load-path "~/emacs/contrib/tramp/lisp")

(require 'tramp)

(add-to-list 'tramp-remote-path "/usr/bsd")

; (setq tramp-verbose 6)
; (tramp-cleanup-all-connections)

(provide 'init-tramp)
