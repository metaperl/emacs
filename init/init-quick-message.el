;;; Facebook

(defun init-facebook()
  (interactive)
  (text-mode)
  (set-fill-column 50))

(add-to-list 'auto-mode-alist '("\\.fb\\'" . init-facebook))

;(setq facebook-dir "~/tmp/facebook")
(setq facebook-dir "/cygdrive/c/Users/terre/Google Drive/Z - Et Cetera")

(defun facebook-message(file-name)
  (interactive "sName of Facebook Message: ")
  (let (
        (file-name (format "%s/%s.fb" facebook-dir file-name)))
    (find-file facebook-file-name)))

;; (defun init-txt()
;;   (interactive)
;;   (text-mode)
;;   (set-fill-column 80))

;; (add-to-list 'auto-mode-alist '("\\.txt\\'" . init-txt))

;(setq facebook-dir "~/tmp/facebook")
(setq txt-dir "/cygdrive/c/Users/terre/Google Drive/tmp")

(defun plain-text-message(file-name)
  (interactive "sName of Text Message File: ")
  (let (
        (file-name (format "%s/%s.txt" txt-dir file-name)))
    (find-file file-name)))



(provide 'init-quick-message)
