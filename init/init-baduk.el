
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(defun sgf-dired()
  (interactive)
  (dired "c:/Users/supreme/Dropbox/Baduk/Games")

  (delete-other-windows)
  (split-window-below)
  (dired "c:/Users/supreme/Downloads/*.sgf"))

(provide 'init-baduk)
