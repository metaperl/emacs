;;; init.el --- Where all the magic begins

;; This is the first thing to get loaded.

;; inspired by technomancy's emacs starter kit
;; http://github.com/technomancy/emacs-starter-kit/blob/master/init.el

(setq debug-on-error t)
(setq gc-cons-threshold 20000000)
(setq grep-find-command
      (quote ("find . -type f -exec grep -nHi -e   {} \\;" . 34)))

;(global-hl-line-mode nil)

;; (require 'tabbar)
;; (tabbar-mode)

(global-auto-revert-mode 1)
(show-paren-mode t)

(setq enable-recursive-minibuffers t)


(add-to-list 'load-path "~/emacs/")
(add-to-list 'load-path "~/emacs/init/")
(add-to-list 'load-path "~/emacs/init/programming")

(require 'init-standard-packages)
(require 'init-custom-packages)
(require 'init-personal-packages)

(require 'init-programming)

(require 'init-delete-trailing-whitespace)

(require 'init-themes)
(require 'init-functions)
(require 'init-settings)
(require 'init-backup-files)
(require 'init-scrolling)

;(require 'init-elm)

(require 'init-keys)

(require 'init-auto-complete)

(require 'init-tramp)
(require 'init-gg)

;;; Programming Languages

;; Python
(require 'init-python)

;; Clojure
(require 'init-clojure)

;(require 'init-afterwards)

(defun init-afterwards()
  (interactive)
  (require 'init-afterwards))

(require 'init-window-system)



;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"
