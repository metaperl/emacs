(setq helm-completion-window-scroll-margin 5)

(if (not (package-installed-p 'helm))
    (progn
      (package-refresh-contents)
      (package-install 'helm)))

(require 'helm-config)

; (helm-mode 1)

(add-hook 'helm-after-initialize-hook (lambda () (with-helm-buffer (visual-line-mode))))

(global-set-key (kbd "C-x b") 'helm-mini)

(setq helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t)

(provide 'init-helm)
