(when window-system
  (eval-after-load "menu-bar" '(require 'menu-bar+))
;  (load-library "color-theme")
 ; (color-theme-initialize)
;  (require 'color-theme-random)

  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
)

(setq scroll-step           1
         scroll-conservatively 10000)

(if (eq window-system 'x) (setq x-select-enable-clipboard t))


(defun MakeThreeWindows ()
  (interactive)
  (delete-other-windows)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
)

;;; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/01b7d4153acf6336#
(defun MakeSixWindows ()
  (interactive)
  (delete-other-windows)
  (split-window-vertically)
  (split-window-horizontally)
  (split-window-horizontally)
  (other-window 3)
  (split-window-horizontally)
  (split-window-horizontally)
  (balance-windows)
)

(global-set-key (kbd "C-x 6") 'MakeSixWindows)

(provide 'init-window-system)
