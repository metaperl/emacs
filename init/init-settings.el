;;;
;;; asciidoc

;; (autoload 'doc-mode   "doc-mode" nil t)
;; (autoload 'adoc-mode "adoc-mode" nil t)
;; (require 'adoc-mode)
;; (add-to-list 'auto-mode-alist '("\\.adoc$" . adoc-mode))
;; (add-hook 'adoc-mode-hook
;; 	  '(lambda ()
;; 	     (turn-on-auto-fill)
;; 	     (require 'asciidoc)))
;;;



(if-bound-call tool-bar-mode -1)
(scroll-bar-mode -1)

(setq visible-bell t)

(setq-default indent-tabs-mode nil)


(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(setq-default case-fold-search t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; 'mixed)

;;; 

(require 'autorevert)
(global-auto-revert-mode 1)

;;; key sets


(global-set-key (kbd "<f12>")   'goto-line)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x 0") 'other-window)


(provide 'init-settings)
