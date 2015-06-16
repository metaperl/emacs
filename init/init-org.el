(setq org-directory "~/org")

(setq org-default-notes-file (concat org-directory "/" "kitchen-sink.org"))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook 'org-indent-mode)

(global-set-key (kbd "C-c l") 'org-store-link)


(provide 'init-org)
