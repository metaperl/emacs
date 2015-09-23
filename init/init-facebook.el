

(defun init-facebook()
  (interactive)
  (text-mode)
  (set-fill-column 52))

(add-to-list 'auto-mode-alist '("\\.fb\\'" . init-facebook))

(setq facebook-dir "~/tmp/facebook")

(defun facebook-message(file-name)
  (interactive "sName of Facebook Message: ")
  (let (
        (facebook-file-name (format "%s/%s.fb" facebook-dir file-name)))
    (find-file facebook-file-name)))

(provide 'init-facebook)
