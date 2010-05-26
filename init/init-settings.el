;;;

(if-bound-call tool-bar-mode -1)

(setq visible-bell t)


(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

(setq-default case-fold-search t)

(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; 'mixed)


(provide 'init-settings)
