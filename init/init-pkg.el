
(add-to-list 'load-path "~/emacs/pkg")

(require 'package)
(setq package-archives
      (list
       '("melpa" . "http://melpa.milkbox.net/packages/")))

;(require 'init-ecb)
;(require 'init-powerline)

(require 'init-helm)

;(require 'init-desktopaid)


(require 'init-org)

;(require 'init-elpy)

(provide 'init-pkg)
