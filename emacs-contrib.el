
;;; asciidoc

(add-to-list 'load-path "~/emacs-contrib/asciidoc-el")
   (autoload 'doc-mode "doc-mode" nil t)
   (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
   (add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;; color-theme

(add-to-list 'load-path "~/emacs-contrib/color-theme-6.6.0")

;;; color-theme-random
;(require 'color-theme-random)

