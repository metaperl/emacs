(package-initialize)

(unless (package-installed-p 'rust-mode)
  (package-refresh-contents)
  (package-install 'rust-mode))

(autoload 'rust-mode "rust-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.rs\\'" . rust-mode))

(provide 'init-rust)
