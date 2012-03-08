(setq dta-dir "~/emacs/pkg/desktopaid/")
(add-to-list 'load-path dta-dir)
(autoload 'dta-hook-up "desktopaid.elc" "Desktop Aid" t)
(dta-hook-up)

(setq dta-cfg-dir dta-dir)

(provide 'init-desktopaid)