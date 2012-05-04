;; desktop

(require 'desktop)
(setq desktop-save t)
(setq desktop-dirname "~/.emacs.d/")
(desktop-save-mode 1)
(setq desktop-restore-eager 3)
(add-to-list 'desktop-globals-to-save 'file-name-history)

(let ((five-minutes (* 1 60)))
  (run-at-time five-minutes five-minutes 'desktop-save))


(provide 'init-desktop)
