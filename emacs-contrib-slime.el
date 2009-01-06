;;; slime

(add-to-list 'load-path "~/emacs-contrib/slime-2.0")

(setq inferior-lisp-program "sbcl")
;(setq inferior-lisp-program "clisp")

(require 'slime)
(slime-setup)

(global-set-key (kbd "<f4>") 'slime-hyperspec-lookup)

(defun restart-slime-helper (bufs)
  (if (null bufs)
      nil
    (progn 
      (let ((target (symbol-name (car bufs))))
	(if (get-buffer target)
	    (kill-buffer target)))
      (restart-slime-helper (cdr bufs)))))

(defun restart-slime ()
  (interactive)
  (let ((bufs '(*inferior-lisp* *slime-events* *slime-repl sbcl*)))
    (progn
      (restart-slime-helper bufs)
      (slime))))
    
