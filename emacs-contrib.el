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
;;; http://github.com/technomancy/clojure-mode/tree/master

(add-to-list 'load-path "c:/tmp/c/technomancy-clojure-mode")
(require 'clojure-mode)

(setq clojure-src-root "c:/tmp/c")
(clojure-slime-config)

(autoload 'clojure-mode "clojure-mode" "A major mode for Clojure" t)
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))


