(require 'init-package)


; (setq package-archives
;       (list
;        '("melpa" . "http://melpa.milkbox.net/packages/")
;         ("marmalade" . "http://marmalade-repo.org/packages/")
;         ("gnu" . "http://elpa.gnu.org/packages/")

(require 'cl)


(setq my-packages
      '(
        auto-complete
        elpy
        flx-ido
        flymake-cursor
        gist
        helm
        highlight-symbol
        htmlize
        iedit
        multiple-cursors
        org
	prodigy
        shell-current-directory
        smex

        )
      )

(setq stk/onlinep nil)
(unless
    (condition-case nil
        (delete-process
         (make-network-process
          :name "stk/check-internet"
          :host "melpa.org"
          :service 80))
      (error t))
  (setq stk/onlinep t))

(when stk/onlinep
  (package-refresh-contents)
  (cl-loop for p in my-packages
           unless (package-installed-p p)
           do (package-install p)))

(provide 'init-load-packages)
