
(add-to-list 'custom-theme-load-path "~/emacs/themes")

; http://www.reddit.com/r/emacs/comments/30b67j/how_can_you_reset_emacs_to_the_default_theme/

(defun reset-theme()
  (interactive)
  (mapcar #'disable-theme custom-enabled-themes))

(defun switch-theme (theme)
  ;; This interactive call is taken from `load-theme'
  (interactive
   (list
    (intern (completing-read "Load custom theme: "
                             (mapcar 'symbol-name
                                     (custom-available-themes))))))
  (mapcar #'disable-theme custom-enabled-themes)
  (load-theme theme t))

(load-theme 'organic-green)

;(lightblue-theme)
;(require 'professional-theme)

(provide 'init-themes)
