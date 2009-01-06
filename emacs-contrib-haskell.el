;;; haskell

(load "~/emacs-contrib/haskell-mode-2.4/haskell-site-file")

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'font-lock-mode)

;; Set haskell binary appropriately
;; Code to detect emacs architecture taken from
;; Jari Aalto's tinylibenv.el in his tinytools

(defsubst ti::emacs-type-cygwin-p ()
  "Check if running Win32 Cygwin version."
  (let ((case-fold-search t))
    (string-match "cygwin" (emacs-version))))

;; ----------------------------------------------------------------------
;;
(defun ti::win32-p ()
  "Check if running under Win32 system.
NOTE: Running under Cygwin is not considered as Win32, use
functions `ti::os-check-linux-like-p' or `ti::win32-cygwin-p'."
  (cond
   ((memq system-type '(ms-dos windows-nt))) ;; Emacs
   ((fboundp 'console-type)
    ;; Quiet Emacs byte compiler
    (memq (funcall (symbol-function 'console-type))
          '(win32 w32 mswindows)))
   ((boundp 'window-system)
    (memq (symbol-value 'window-system)
          '(win32 w32 mswindows)))
   ((error "Internal alert, contact maintainer of TinyLib."))))

;; ----------------------------------------------------------------------
;;
(defsubst ti::emacs-type-win32-p ()
  "Check if running native Win32 version of Emacs or XEmacs."
  (and (ti::win32-p)
       (not (ti::emacs-type-cygwin-p))))

;; ----------------------------------------------------------------------
;;
(defsubst ti::emacs-type-unix-like-p ()
  "Check if running Unix Emacs or Cygwin Emacs."
  (or (not (ti::win32-p))
      (ti::emacs-type-cygwin-p)))

(cond
 ((ti::emacs-type-cygwin-p)
  (setq haskell-program-name "/cygdrive/c/ghc/ghc-6.8.2/bin/ghcii.sh"))
 ((ti::emacs-type-win32-p)
  (setq haskell-program-name "c:/ghc/ghc-6.8.1/bin/ghci.exe"))
 (t nil))

