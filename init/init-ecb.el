
(require 'cedet)

 (semantic-mode 1)

(setq ecb-layout-name "leftright1")

(add-to-list 'load-path (expand-file-name "~/emacs/pkg/ecb"))

;(require 'ecb-autoloads)

(require 'ecb)

; (setq debug-on-error t)

(provide 'init-ecb)
