;;; init.el --- Where all the magic begins

;; This is the first thing to get loaded.

;; inspired by technomancy's emacs starter kit
;; http://github.com/technomancy/emacs-starter-kit/blob/master/init.el


(setq stack-trace-on-error t)

(add-to-list 'load-path "~/emacs/")
(add-to-list 'load-path "~/emacs/init/")

(require 'init-delete-trailing-whitespace)

;(require 'init-cedet)

;(require 'init-tmp)

(require 'init-themes)

(require 'init-tramp)
(require 'init-functions)


(require 'init-settings)
(require 'init-standard-packages)
(require 'init-custom)
(require 'init-pkg)

;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"
