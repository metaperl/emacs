(setq
 nnmail-spool-file "/var/mail/anicca"
 gnus-select-method '(nnml "")
)

(setq nnmail-split-methods
	  '(
	     ("Other" "")))


(provide 'init-gnus)
