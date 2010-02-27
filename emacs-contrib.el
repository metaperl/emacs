
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


;; Factor

(if (windows-nt-p)
    (let (
	  (factor-fuel "c:/Program_Files/factor/misc/fuel/fu.el")
	  )
      (progn
	(setq fuel-scaffold-developer-name "Terrence Brannon <http://www.metaperl.org>")
	(load-file factor-fuel))))
      
