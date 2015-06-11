(package-initialize)

; (setq elpy-rpc-backendl "jedi")

(require 'elpy)
(elpy-enable)


(add-hook 'python-mode-hook
     '(lambda () (define-key python-mode-map (kbd "C-m") 'newline-and-indent)))

(provide 'init-python)
