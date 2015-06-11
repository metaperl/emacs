(package-initialize)

(autoload 'sml-mode "sml" "Some documentation." t)
(add-to-list 'auto-mode-alist '("\\.sml\\'" . sml-mode))

(provide 'init-sml)
