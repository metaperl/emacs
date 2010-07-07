(require 'init-tramp)
(require 'init-uniquify)
(require 'init-shell)
(require 'init-dired)
(require 'init-desktop)


(defalias 'perl-mode 'cperl-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill t)

;; latex
(add-hook 'latex-mode-hook 'turn-on-auto-fill t)
(setq latex-run-command "pdflatex")

;; bookmark

(setq-default bookmark-default-file "~/emacs/bmk.el")

(provide 'init-standard-packages)
