
;; Put autosave files (ie #foo#) and backup files (ie foo~) in ~/.emacs.d/.
(defun mv-sgf()
  (interactive)
  (dired "c:/Users/supreme/Dropbox/Baduk/Games")

  (delete-other-windows)
  (split-window-below)
  (dired "c:/Users/supreme/Downloads"))

(provide 'init-baduk)
