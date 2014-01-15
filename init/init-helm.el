(setq helm-completion-window-scroll-margin 5)
(require 'helm)
(require 'helm-config)

; (helm-mode 1)


(global-set-key (kbd "C-x b") 'helm-mini)



(provide 'init-helm)
