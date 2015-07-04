

(defun init-facebook()
  (interactive)
  (text-mode)
  (set-fill-column 57))

(add-to-list 'auto-mode-alist '("\\.fb\\'" . init-facebook))


(provide 'init-facebook)
