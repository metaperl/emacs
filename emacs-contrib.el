;;; 


(require 'cperl-mode)

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

;; Load CEDET.
;; See cedet/common/cedet.info for configuration details.
(load-file "~/emacs-contrib/cedet-1.0pre7/common/cedet.el")


;; Enable EDE (Project Management) features
(global-ede-mode 1)

;; Enable EDE for a pre-existing C++ project
;; (ede-cpp-root-project "NAME" :file "~/myproject/Makefile")


;; Enabling Semantic (code-parsing, smart completion) features
;; Select one of the following:

;; * This enables the database and idle reparse engines
(semantic-load-enable-minimum-features)

;; * This enables some tools useful for coding, such as summary mode
;;   imenu support, and the semantic navigator
(semantic-load-enable-code-helpers)

;;;
(add-to-list 'load-path  "~/emacs-contrib/ecb")

(require 'ecb)


      

(provide 'emacs-contrib)