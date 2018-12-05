
(global-unset-key [C-mouse-1])

(global-set-key (kbd "C-x 5") 'split-window-horizontally)

; (global-set-key (kbd "<f1>") 'other-frame)
(global-set-key (kbd "<f1>") 'next-multiframe-window)
(global-set-key (kbd "<f2>") 'helm-mini)

(provide 'init-keys)
