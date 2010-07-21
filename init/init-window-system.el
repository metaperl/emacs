(when window-system
  (eval-after-load "menu-bar" '(require 'menu-bar+))
;  (load-library "color-theme")
 ; (color-theme-initialize)
;  (require 'color-theme-random)

  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
)

(if (eq window-system 'x) (setq x-select-enable-clipboard t))

;;; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/01b7d4153acf6336#
(defun MakeSixWindows ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (setq windowColumns
    (let ((edges (window-edges))) (- (nth 2 edges) (nth 0 edges))) )
  (split-window-horizontally (round (* windowColumns 0.66)))
  (split-window-horizontally)
  (previous-multiframe-window)
  (split-window-horizontally (round (* windowColumns 0.66)))
  (split-window-horizontally)
)

(global-set-key (kbd "C-x 6") 'MakeSixWindows)

(provide 'init-window-system)