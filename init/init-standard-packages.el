
(require 'init-uniquify)

(require 'init-dired)
(require 'init-gnus)
(require 'init-desktop)



(add-hook 'text-mode-hook 'turn-on-auto-fill t)

;; latex
(add-hook 'latex-mode-hook 'turn-on-auto-fill t)
(setq latex-run-command "pdflatex")

(require 'init-bookmark)


;; ffap

(ffap-bindings)







(provide 'init-standard-packages)
