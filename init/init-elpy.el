
(setq elpy-rpc-backend "jedi")


(require 'elpy)
(elpy-enable)

(add-hook 'python-mode-hook
      (lambda ()
        (setq indent-tabs-mode t)
        (setq tab-width 4)
        (setq python-indent 4)))

(defun get-elpy()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives
	       '("elpy" . "http://jorgenschaefer.github.io/packages/"))
  (package-refresh-contents)
  (package-install 'elpy))

(provide 'init-elpy)
