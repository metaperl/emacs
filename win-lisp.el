    (add-to-list 'load-path "c:/Documents and Settings/Administrator/My Documents/dl/slime-2.0/")
    (setq inferior-lisp-program "c:/Program_Files/SBCL/1.0.9/sbcl")
    (require 'slime)
    (slime-setup)

;; (add-hook 'slime-mode-hook
;;                (lambda ()
;;                  (unless (slime-connected-p)
;;                    (save-excursion (slime)))))

