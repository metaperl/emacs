(setq wg-file "~/emacs/etc/workgroups/workgroups.data")

(add-to-list 'load-path "~/emacs/pkg/workgroups.el/")
(require 'workgroups)

(workgroups-mode 1)

(wg-load "~/emacs/etc/workgroups/workgroups.data")


(provide 'init-workgroups)
