;;; asciidoc

(add-to-list 'load-path "~/emacs-contrib/asciidoc-el")
   (autoload 'doc-mode "doc-mode" nil t)
   (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
   (add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; color-theme

(add-to-list 'load-path "~/emacs-contrib/color-theme-6.6.0")


;;; clojure-mode 
;;; http://github.com/jochu/clojure-mode/tree/master

(add-to-list 'load-path "~/emacs-contrib/clojure-mode")

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))
