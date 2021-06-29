;;; init.el --- Where all the magic begins

;; This is the first thing to get loaded.

;; inspired by technomancy's emacs starter kit
;; http://github.com/technomancy/emacs-starter-kit/blob/master/init.el


(setq debug-on-error t)
(setq stack-trace-on-error t)

(add-to-list 'load-path (expand-file-name "~/emacs"))
(add-to-list 'load-path (expand-file-name "~/emacs/init"))


(require 'init-standard-packages)
(require 'init-custom-packages)

(require 'init-auto-complete)

(require 'init-tramp)
(require 'init-gg)

(require 'init-programming)

;(require 'init-afterwards)

(defun init-afterwards()
  (interactive)
  (require 'init-afterwards))

(require 'init-window-system)

(require 'init-hacks)

(require 'init-baduk)

                                        ; (helm-mini)

(require 'color-theme-random)

;; "Emacs outshines all other editing software in approximately the
;; same way that the noonday sun does the stars. It is not just bigger
;; and brighter; it simply makes everything else vanish."
;; -Neal Stephenson, "In the Beginning was the Command Line"
