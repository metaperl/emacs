(defvar my-frame-config nil
  "My frame configuration to persist")

(defun my-restore-frame-config ()
  "Restore frame configuration"
  (interactive)
  (set-frame-configuration (car my-frame-config) (not delete))
  (goto-char (cadr my-frame-config))

(defun my-save-frame-config ()
  "Save frame configuration"
  (interactive)
  (setq my-frame-config (list (current-frame-configuration) (point-marker))))
