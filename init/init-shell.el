;;; shell access

(setq comint-buffer-maximum-size 20000)
(ansi-color-for-comint-mode-on)
;(setq explicit-shell-file-name "bash")
(use-package shell-current-directory  :ensure)
(require 'shell-current-directory)
(global-set-key (kbd "<f9>") 'shell-current-directory)
(require 'comint)
(add-to-list 'comint-output-filter-functions 'comint-truncate-buffer)


(provide 'init-shell)
