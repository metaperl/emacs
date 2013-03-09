
;(setq org-path "~/emacs/pkg/org-mode/")

;(setq load-path (cons org-path load-path))

(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))

(add-hook 'org-mode-hook 'org-indent-mode)

; you could add a function to mako-nxhtml-mumamo-mode-hook

(provide 'init-org)
