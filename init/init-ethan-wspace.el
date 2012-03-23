
(setq pkg-path "~/emacs/pkg/ethan-wspace/lisp")

(setq load-path (cons pkg-path load-path))

(require 'ethan-wspace)
(global-ethan-wspace-mode 1)



; you could add a function to mako-nxhtml-mumamo-mode-hook

(provide 'init-ethan-wspace)
