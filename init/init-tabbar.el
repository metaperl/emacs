; http://amitp.blogspot.com/2018/10/emacs-prettier-tabbar.html#more

;; Tab Bar
(use-package tabbar :ensure t)
(customize-set-variable 'tabbar-background-color "gray20")
(customize-set-variable 'tabbar-separator '(0.5))
(customize-set-variable 'tabbar-use-images nil)
(tabbar-mode 1)

;; My preferred keys
;(define-key global-map [M-left] 'tabbar-backward)
;(define-key global-map [M-right] 'tabbar-forward)

;; Colors
(set-face-attribute 'tabbar-default nil
        :background "gray20" :foreground
        "gray60" :distant-foreground "gray50"
        :family "Helvetica Neue" :box nil)
(set-face-attribute 'tabbar-unselected nil
        :background "gray80" :foreground "black" :box nil)
(set-face-attribute 'tabbar-modified nil
        :foreground "red4" :box nil
        :inherit 'tabbar-unselected)
(set-face-attribute 'tabbar-selected nil
        :background "#4090c0" :foreground "white" :box nil)
(set-face-attribute 'tabbar-selected-modified nil
        :inherit 'tabbar-selected :foreground "GoldenRod2" :box nil)
(set-face-attribute 'tabbar-button nil
                    :box nil)


(setq tabbar-buffer-groups-function
             (lambda ()
               (list "All")))


;; Use Powerline to make tabs look nicer
;; (this needs to run *after* the colors are set)
(use-package powerline :ensure t)
(defvar my/tabbar-height 20)
(defvar my/tabbar-left (powerline-wave-right 'tabbar-default nil my/tabbar-height))
(defvar my/tabbar-right (powerline-wave-left nil 'tabbar-default my/tabbar-height))
(defun my/tabbar-tab-label-function (tab)
  (powerline-render (list my/tabbar-left
                          (format " %s  " (car tab))
                          my/tabbar-right)))
(setq tabbar-tab-label-function #'my/tabbar-tab-label-function)

(provide 'init-tabbar)
