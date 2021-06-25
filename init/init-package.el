;;; Customization follows below

(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3") 

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/"))

(package-initialize) ;; You might already have this line

(provide 'init-package-el)
