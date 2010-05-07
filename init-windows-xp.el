
;;; "Emacs on Windows XP -> Cygwin" http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/8f52d7f83dd0fb28/72c4d30d8603b4ee?lnk=gst&q=cygwin#72c4d30d8603b4ee


(if (and (eq system-type 'windows-nt)
         (require 'cygwin-mount nil t))
    (progn
      (setenv "PATH" (concat "c:/cygwin/bin;" (getenv "PATH")))
      (setq exec-path (cons "c:/cygwin/bin/" exec-path))
      (require 'setup-cygwin)))


(provide 'init-windows-xp)