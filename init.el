(setq debug-on-error t)
(setq initial-scratch-message nil)

(setq case-fold-search t)

;;; desktop

;(require 'desktop)
;(setq desktop-save t)
;(setq desktop-dirname "~/.emacs.d/")
;(desktop-save-mode 1)
;(setq desktop-restore-eager 3)

;;; desktopaid



;;; 

(add-to-list 'load-path (expand-file-name "~/emacs"))
(load "emacs-contrib")




(when window-system
  (eval-after-load "menu-bar" '(require 'menu-bar+))
  (load-library "color-theme")
  (color-theme-initialize)
  ;(require 'color-theme-random)
  ;(setq default-cursor-type 'hbar) ; (setq default-cursor-type '(hbar . 2))
  (tool-bar-mode 0)
  (scroll-bar-mode -1)
  (mouse-wheel-mode 1)
)

(setq visible-bell t)

;;;

(require 'font-lock)
(global-font-lock-mode 1)
(setq font-lock-maximum-decoration t)

;(add-to-list 'default-frame-alist '(font . "fixed"))


;;;

  
(defun tidy-buffer-internal ()
  (shell-command-on-region (point-min) (point-max) "tidy -i"
			   (current-buffer)
			   t
			   )
  )

(fset 'debody
   [?\C-[ ?< ?\C-s ?< ?b ?o ?d ?y ?> ?\C-s ?\C-n ?\C-a ?\C-[ ?< ?\C-x ?\C-x ?\C-w ?\C-s ?< ?/ ?b ?o ?d ?y ?\C-p ?\C-e ?\C-[ ?> ?\C-x ?\C-x ?\C-w return ?\C-x ?\C-s])


(defun tidy-buffer ()
  (interactive)
  (tidy-buffer-internal)
  (execute-kbd-macro 'debody))

;;; key sets


;(global-set-key (kbd "C-x C-b") 'ibuffer)
;(global-set-key (kbd "C-x C-b") 'buffer-menu)

(global-set-key (kbd "<f12>")   'goto-line)

(global-set-key (kbd "C-h") 'backward-delete-char)
(global-set-key (kbd "C-M-h") 'backward-kill-word)

;;; uniquify

(require 'uniquify)
;(setq uniquify-buffer-name-style 'reverse)
;(setq uniquify-buffer-name-style 'forward)
(setq uniquify-buffer-name-style 'post-forward)
;(setq uniquify-buffer-name-style 'post-forward-angle-brackets)

;;; shell access

(setq comint-buffer-maximum-size 20000)

;(setq explicit-shell-file-name "bash")
(require 'shell-current-directory)
(global-set-key (kbd "M-s") 'shell-current-directory)
(require 'comint)
(add-to-list 'comint-output-filter-functions 'comint-truncate-buffer)



;;; latex

(add-hook 'latex-mode-hook 'turn-on-auto-fill t)

;;; asciidoc

(autoload 'doc-mode "doc-mode" nil t)
(add-to-list 'auto-mode-alist '("\\.adoc$" . doc-mode))
(add-hook 'doc-mode-hook
	  '(lambda ()
	     (turn-on-auto-fill)
	     (require 'asciidoc)))

;;; dired

     (add-hook 'dired-load-hook
               (lambda ()
                 (load "dired-x")
                 ;; Set dired-x global variables here.  For example:
                 ;; (setq dired-guess-shell-gnutar "gtar")
                 ;; (setq dired-x-hands-off-my-keys nil)
                 ))
     (add-hook 'dired-mode-hook
               (lambda ()
                 ;; Set dired-x buffer-local variables here.  For example:
                 ;(dired-omit-mode 1)
                 ))


(setq dired-dwim-target t) 

;;; 

(require 'autorevert)
(global-auto-revert-mode 1)

;;; proxy at work

(setq url-proxy-services
      '(
	("http"     . "webproxy.ny.jpmorgan.com:8000")
	))


;;; Python

(add-to-list 'auto-mode-alist '("\\.py$" . python-mode))

;;; Lisp

(show-paren-mode t)
(setq show-paren-style 'parenthesis) ; 'mixed)


;;; lisp

;(setq inferior-lisp-program "sbcl")

;; (defun lisp-send-buffer ()
;;   (interactive)
;;   (lisp-eval-region (point-min) (point-max)))

;; (setq debug-on-error t)

;; (global-set-key (kbd "<f5>")   'lisp-send-buffer)

;;; scheme

;(require 'quack)
;(setq quack-run-scheme-always-prompts-p nil)
;(setq quack-default-program "csi")

;;;

;(require 'tabbar) 
;(tabbar-mode 1) 


;;; misc

(fset 'six-windows-emacs-22
   "\C-x1\C-x3\C-x3\C-x+\C-x2\C-xo\C-xo\C-x2\C-xo\C-xo\C-x2")


(fset 'six-windows
   [?\C-[ ?x ?s ?e ?t ?- ?d ?e ?f tab return ?f ?i ?x ?e ?d return ?\C-x ?1 ?\C-x ?3 ?\C-x ?3 ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-x ?2 ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?3 ?\C-x ?} ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?3 ?\C-x ?} ?\C-x ?o ?\C-x ?o ?\C-u ?2 ?4 ?\C-x ?{])



(defun startup ()
  (interactive)
  (set-default-font "fixed")
  (six-windows))


;;; TRAMP

;(add-to-list 'backup-directory-alist (cons tramp-file-name-regexp nil))

(setq tramp-default-method "ssh")
;(setq tramp-default-method "rsync")






;(require 'vkill)


; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/b2f12841338f016f#
(defun commify (n &optional comma-char) 


 (unless comma-char (setq comma-char ",")) 

 (with-temp-buffer 
   (insert (format "%s" n)) 
   (while (> (- (point) 
                (line-beginning-position)) 
             (if (>= n 0) 3 4)) 
     (backward-char 3) 
     (insert comma-char) 
     (backward-char 1)) 
   (buffer-string)))


;; ido

   (require 'ido)
    (ido-mode t)

;;; 



(setq ansi-color-for-comint-mode t)


;;;

;; (copy-file 
;;  "~/prg/wrk/opt/hei/cgi-test/ocog_cust_serv_query_cgi" 
;;  "/tbrannon@natasha.regents.state.oh.us:/opt/hei/cgi-test/"
;;  t)

