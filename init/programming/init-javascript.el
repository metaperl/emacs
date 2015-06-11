(package-initialize)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

                                        ; https://github.com/ScottyB/ac-js2

(add-hook 'js2-mode-hook 'ac-js2-mode)
(setq ac-js2-evaluate-calls t)
; (setq ac-js2-external-libraries '("full/path/to/a-library.js"))


(provide 'init-python)
