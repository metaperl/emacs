;;; key sets


     (add-to-list 'same-window-buffer-names "*Buffer List*")

(require 'buff-menu+) 
(global-set-key "\C-x\C-b" 'buffer-menu)


(provide 'init-buffer-menu)