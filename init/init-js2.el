(package-initialize)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

                                        ; https://github.com/ScottyB/ac-js2

(require 'auto-complete)
(add-to-list 'ac-modes 'js2-mode)



(provide 'init-js2)
