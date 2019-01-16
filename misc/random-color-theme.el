; custom-available-themes

(setq color-themes (custom-available-themes))

(defun random-color-theme ()
  (interactive)
  (random t)
  (load-theme
   (nth (random (length color-themes)) color-themes)
   t))


(defun cycle-random-color-theme ()
  (interactive)
  (setq rct-interval 45) ; minutes between rand selection
  (run-with-timer 1 (* rct-interval 60) 'random-color-theme))

(provide 'random-color-theme)
