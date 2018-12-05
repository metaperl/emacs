; custom-available-themes

(setq color-themes (custom-available-themes))
(setq rct-interval 1) ; minutes between rand selection

(defun random-color-theme ()
  (interactive)
  (random t)
  (load-theme
   (nth (random (length color-themes)) color-themes)
   t))


(random-color-theme)

(run-with-timer 1 (* rct-interval 60) 'random-color-theme)
