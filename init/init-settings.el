(if-bound-call tool-bar-mode -1)
(if-bound-call scroll-bar-mode -1)
;(if-bound-call menu-bar-mode -1)


(setq visible-bell nil)

(setq-default indent-tabs-mode nil)


(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(setq-default case-fold-search t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; 'mixed)

(require 'autorevert)
(global-auto-revert-mode 1)


(global-set-key (kbd "<f8>")   'other-frame)
(global-set-key (kbd "<f12>")   'goto-line)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-M-h") 'backward-kill-word)
(global-set-key (kbd "C-x 0") 'other-window)


(provide 'init-settings)
