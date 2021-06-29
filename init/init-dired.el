;;; dired

(require 'dired-x)
;(setq dired-omit-mode 1)
(setq dired-omit-files "^#\\|~$")
(setq dired-omit-files (concat dired-omit-files "\\|^.+.pyc$"))

(setq dired-dwim-target t)


(provide 'init-dired)
