(setq my-font-size "14")
(setq my-font-family "Courier New")
(setq my-font-family "PT Mono")

(setq my-font (concat my-font-family " " my-font-size))

(set-frame-font my-font)

(add-to-list 'initial-frame-alist '(font . my-font))
(add-to-list 'default-frame-alist '(font . my-font))

; (text-scale-normal-size)
(text-scale-increase 1)  ; 2 steps larger
(text-scale-decrease 1)  ; 2 steps larger


(provide 'init-font)
