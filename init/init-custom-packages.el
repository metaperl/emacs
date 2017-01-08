(load "package")
;(add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/"))
(add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/"))
;(add-to-list 'load-path "~/emacs/pkg")
(package-initialize)

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
