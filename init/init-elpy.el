
(setq elpy-rpc-backend "jedi")


(use-package elpy :ensure)
(elpy-enable)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode nil)
        (setq tab-width 4)
        (setq python-indent 4)))

(defun get-elpy()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives
	       '("elpy" . "http://jorgenschaefer.github.io/packages/"))
  (package-refresh-contents)
  (package-install 'elpy))

(defun my-python-mode-action ()
  (interactive)
  (make-local-variable 'before-save-hook)
  (add-hook 'before-save-hook (lambda ()
                                (save-restriction
                                  (widen)
                                  (untabify (point-min) (point-max))))))

(add-hook 'python-mode-hook 'my-python-mode-action)

(provide 'init-elpy)
