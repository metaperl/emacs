(setq workgroups-data "~/.emacs.d/workgroups.data")

(setq wg-file workgroups-data)

(add-to-list 'load-path "~/emacs/pkg/workgroups.el/")
(require 'workgroups)

(workgroups-mode 1)

(wg-load workgroups-data)

; (define-key global-map [(control ?9)] (make-keymap 'control-9-keymap))
; (global-set-key [(control ?9) (control ?b)] (lambda () (interactive) (find-file "~/.bash_profile")))
(provide 'init-workgroups)
