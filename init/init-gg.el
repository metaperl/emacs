
        ;; (eval-after-load 'package
        ;;   '(add-to-list 'package-archives
        ;;                 '("GELPA" . "http://internal-elpa.appspot.com/packages/"  )))

; (require 'google)


(setq compile-command "g4 lint")

(defun shell-command-on-buffer-file ()
 "prompts for a command and executes that command on to the associated
 file of current buffer. if no buffer is associated gives an error"
  (interactive)
  (or (buffer-file-name) (error "no file is associated file to this buffer"))
  (let* ((my-cmd (read-shell-command "Command to run: "))
         (cmd-to-run (concat my-cmd " " (buffer-file-name))))
   (shell-command cmd-to-run)))

(defun g4-edit ()
  (interactive)
  (let ((*point* (point)))
    (shell-command (concat "g4 edit " (buffer-file-name)))
    (find-alternate-file (buffer-file-name))
    (goto-char *point*)
    (recenter-top-bottom)))

(defun g4-revert ()
  (interactive)
  (shell-command (concat "g4 revert " (buffer-file-name)))
  (find-alternate-file (buffer-file-name)))

(defun g4-lint ()
  (interactive)
  (shell-command "g4 lint"))

(defun g4-pending ()
  (interactive)
  (shell-command "g4 p"))

(defun g4-diff ()
  (interactive)
  (shell-command "g4 diff"))

(require 'flymake-cursor)

(defun hu-tests(search replace)
  (let
      ((beg (point))
       )
    (goto-char (point-min))
    (replace-string search replace)
    (goto-char beg))
  (save-buffer))

(defun hide-tests()
  (interactive)
  (hu-tests "def test" "def notest"))

(defun unhide-tests()
  (interactive)
  (hu-tests "def notest" "def test"))


(provide 'init-gg)
