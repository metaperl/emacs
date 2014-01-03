
(add-to-list 'load-path "~/emacs/pkg")

(require 'package)

;; (setq package-archives
;;       (list
;;        '("melpa" . "http://melpa.milkbox.net/packages/")))

;                       ("marmalade" . "http://marmalade-repo.org/packages/")
; ("gnu" . "http://elpa.gnu.org/packages/")
(setq package-archives '(

                         ("melpa" . "http://melpa.milkbox.net/packages/")))


(require 'init-dired)

(require 'init-flx-ido)

;(require 'init-ecb)
;(require 'init-powerline)

(require 'init-helm)

;(require 'init-desktopaid)


(require 'init-org)

;(require 'init-elpy)

(provide 'init-pkg)
