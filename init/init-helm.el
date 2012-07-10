

(add-to-list 'load-path "~/emacs/pkg/helm/")
(require 'helm-config)

;; (defun helm-my-buffers ()
;;   (interactive)
;;   (helm-other-buffer '(helm-c-source-buffers-list
;;                        helm-c-source-files-in-current-dir
;;                        helm-c-source-recentf
;;                        helm-c-source-buffer-not-found)
;;                      "*helm-my-buffers*"))

(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x o") 'other-window)


(provide 'init-helm)
