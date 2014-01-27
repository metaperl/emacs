
(add-to-list 'load-path "~/emacs/pkg")


(setq package-archives '(
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

;(require 'init-load-packages)

(require 'init-helm)
(require 'init-smex)
(require 'init-flx-ido)
(require 'init-prodigy)

(require 'init-org)

(provide 'init-custom-packages)
