(load "package")
(package-initialize)

;(add-to-list 'load-path "~/emacs/pkg")


(setq package-archives '(
                         ("melpa" . "http://melpa.org/packages/")))


(require 'init-helm)
(require 'init-smex)
(require 'init-flx-ido)
(require 'init-org)

;(require 'init-autopair)
;(require 'init-load-packages)
;(require 'init-shell)
;(require 'init-prodigy)











(provide 'init-custom-packages)
