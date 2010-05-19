;;; Customization follows below
(setq history-length 250)

;; ELPA

(when
    (load
     (expand-file-name "~/.emacs.d/elpa/package.el"))
  (package-initialize))


(provide 'init-package-el)