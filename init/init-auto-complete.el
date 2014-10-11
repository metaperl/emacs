

(let ((v "~/.emacs.d/elpa/auto-complete-20140824.1658/"))
  (if (boundp 'ac-dictionary-directories)
      (add-to-list 'ac-dictionary-directories v)
    (setq ac-dictionary-directories (listv))))
(require 'auto-complete-config)
(ac-config-default)

(add-to-list 'load-path "~/.emacs.d")

(require 'auto-complete-config)
(ac-config-default)

(provide 'init-auto-complete)
