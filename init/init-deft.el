;;; dired

(require 'deft)

(setq deft-extensions '("org" "txt"))
(setq deft-directory "~/../../Dropbox")

(setq deft-recursive t)

; (setq deft-ignore-file-regexp "

(global-set-key [f8] 'deft)

(provide 'init-deft)
