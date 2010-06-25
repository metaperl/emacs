;;; asciidoc

(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; 

(require 'autorevert)
(global-auto-revert-mode 1)



;;; paste buffer

(require 'pastebin)


(provide 'init-emacs)
