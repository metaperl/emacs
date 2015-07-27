

(require 'elpy)
(elpy-enable)


(defun get-elpy()
  (interactive)
  (require 'package)
  (add-to-list 'package-archives
	       '("elpy" . "http://jorgenschaefer.github.io/packages/"))
  (package-refresh-contents)
  (package-install 'elpy))

(provide 'init-elpy)
