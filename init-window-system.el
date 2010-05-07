(when window-system
  (eval-after-load "menu-bar" '(require 'menu-bar+))
  (load-library "color-theme")
  (color-theme-initialize)
  (require 'color-theme-random)

  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
)


(provide 'init-window-system)