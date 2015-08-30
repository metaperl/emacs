(package-initialize)

(add-hook 'python-mode-hook
     '(lambda () (define-key python-mode-map (kbd "C-m") 'newline-and-indent)))

(require 'init-elpy)

(provide 'init-python)
