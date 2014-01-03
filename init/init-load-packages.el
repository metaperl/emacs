(setq my-packages
      '(
        elpy
        flx-ido
        gist
        grandshell-theme
        helm
        helm-descbinds
        helm-c-yasnippet
        helm-gtags
        helm-git
        helm-projectile
        highlight-symbol
        htmlize
        iedit
        org
        shell-current-directory
        )
      )

(when stk/onlinep
  (package-refresh-contents)
  (cl-loop for p in my-packages
           unless (package-installed-p p)
           do (package-install p)))

(provide 'init-load-packages)
