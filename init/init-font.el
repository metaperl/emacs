(setq my-font-size "14")
(setq my-font-family-mac "Courier New")
(setq my-font-family-mac "PT Mono")
(setq my-font-family-win "Consolas")



(setq my-font-mac (concat my-font-family-mac " " my-font-size))
(setq my-font-win (concat my-font-family-win " " my-font-size))



(cond
 ((string-equal system-type "windows-nt") ; Microsoft Windows
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . my-font-win)
    (add-to-list 'default-frame-alist '(font . my-font-win)))))
 ((string-equal system-type "darwin") ; Mac OS X
    (add-to-list 'initial-frame-alist '(font . my-font-mac)
    (add-to-list 'default-frame-alist '(font . my-font-mac))))
 ((string-equal system-type "gnu/linux") ; linux
  (when (member "DejaVu Sans Mono" (font-family-list))
    (add-to-list 'initial-frame-alist '(font . "DejaVu Sans Mono-10"))
    (add-to-list 'default-frame-alist '(font . "DejaVu Sans Mono-10")))))



; (text-scale-normal-size)
(text-scale-increase 1)  ; 2 steps larger
(text-scale-decrease 1)  ; 2 steps larger


(provide 'init-font)
