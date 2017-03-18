(package-initialize)

;; (unless (package-installed-p 'rust-mode)
;;   (package-refresh-contents)
;;   (package-install 'rust-mode))

(add-to-list 'load-path (concat dropbox-programming "red.el"))

(autoload 'red-mode "red" nil t)
(add-to-list 'auto-mode-alist '("\\.red\\'" . red-mode))

(provide 'init-red)
