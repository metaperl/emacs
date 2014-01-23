
(add-to-list 'load-path "~/emacs/pkg")

(require 'package)
(package-initialize)

; (setq package-archives
;       (list
;        '("melpa" . "http://melpa.milkbox.net/packages/")
;         ("marmalade" . "http://marmalade-repo.org/packages/")
;         ("gnu" . "http://elpa.gnu.org/packages/")
(setq package-archives '(
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(require 'init-load-packages)


(require 'init-helm)
(require 'init-flx-ido)
(require 'init-prodigy)

(require 'init-org)

(provide 'init-pkg)
