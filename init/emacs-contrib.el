(add-to-list 'load-path "~/emacs/contrib/")



;;; asciidoc

;; (add-to-list 'load-path "~/emacs/contrib/asciidoc-el")
;;    (autoload 'doc-mode "doc-mode" nil t)
;;    (add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
;;    (add-hook 'doc-mode-hook
;; 	  '(lambda ()
;; 	     (turn-on-auto-fill)
;; 	     (require 'asciidoc)))


;;;
(add-to-list 'load-path  "~/emacs/contrib/ecb-snap")

(require 'ecb)


      

(provide 'emacs-contrib)