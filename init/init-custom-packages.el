(load "package")
(package-initialize)

;(add-to-list 'load-path "~/emacs/pkg")

(setq package-archives '(
                         ("melpa" . "http://melpa.org/packages/")))

(if (not (package-installed-p 'use-package))
    (progn
      (package-refresh-contents)
      (package-install 'use-package)))

(require 'use-package)

(require 'init-helm)
(require 'init-smex)
(require 'init-flx-ido)
(require 'init-org)

;(require 'init-autopair)
;(require 'init-load-packages)
;(require 'init-shell)
;(require 'init-prodigy)











(provide 'init-custom-packages)
