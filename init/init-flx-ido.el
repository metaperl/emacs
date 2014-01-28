(require 'flx-ido)
(ido-mode 1)
(ido-everywhere 1)
(flx-ido-mode 1)
;; disable ido faces to see flx highlights.
(setq ido-use-faces nil)

(global-set-key (kbd "C-x d") 'ido-dired)
(global-set-key (kbd "C-x C-f") 'ido-find-file)
(global-set-key (kbd "C-x 4 f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x 5 f") 'ido-find-file-other-frame)

(provide 'init-flx-ido)
