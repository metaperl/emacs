;;; TRAMP

; (add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

(setq-default tramp-default-method "ssh")
;(setq tramp-default-method "scp")
;(setq tramp-default-method "rsync")

(require 'tramp)

(provide 'init-tramp)