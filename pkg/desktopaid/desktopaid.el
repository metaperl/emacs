;;; desktopaid.el --- Desktop Aid, saves/loads emacs sessions

;; $Id: desktopaid.el,v 1.8 2002/04/07 15:54:11 airborne Exp $

;; Copyright (C) 1999-2001 Kris Verbeeck <kris.verbeeck@advalvas.be>

;; Keywords: desktop, aid, session

;; This file is NOT part of GNU Emacs.

; This program is free software; you can redistribute it and/or
; modify it under the terms of the GNU General Public License
; as published by the Free Software Foundation; either version 2
; of the License, or (at your option) any later version.
;
; This program is distributed in the hope that it will be useful,
; but WITHOUT ANY WARRANTY; without even the implied warranty of
; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
; GNU General Public License for more details.
;
; You should have received a copy of the GNU General Public License
; along with this program; if not, write to the Free Software
; Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

; The complete text of the license can be found at:
;    http://www.gnu.ai.mit.edu/copyleft/gpl.html

;;; Commentary:

;; Installation

; Make sure the installation path of desktopaid.el or desktopaid.elc
; is in the Emacs load-path variable.  Include the following lines in
; your .emacs or .xemacs/init.el file:
;
;    (setq load-path (cons "<path-to-desktopaid.elc>/" load-path))
;    (autoload 'dta-hook-up "desktopaid.elc" "Desktop Aid" t)
;
; If you want to automate the saving/loading of sessions then also
; put the following line in that file:
;
;    (dta-hook-up)

;; Structure of session file

; Desktop Aid stores a file (default.conf) with session info in a
; subdirectory (.desktopaid) of the user's home directory.  This
; file contains the following elisp objects:
;
; 1) list of (file-name . position-in-file)
; 2) list of frame information (width height x y visited-file)
; 3) list with file name history

; It is also possible to load and save configuration files with the
; 'dta-load-session' and 'dta-save-session' interactive commands.

;;; ChangeLog

; 2002/04/07 - Fixed conflict with saveplace.el (put point at beginning of 
;              session conifguration buffer before reading anything from it).
;            - The default configuration file will now also be adjusted when
;              you save a configuration (see also previous change below).
;            - Extra functionality when dta-default-auto is true:  when you
;              switch sessions, the currently active session will be saved
;              before loading the new session.
;            - The default configuration setting will now only be saved to
;              your .emacs file when you exit (X)Emacs.
; 2001/12/03 - Added the dta-default-auto option which will automatically
;              adjust the default configuration file when you load a session.
;              (suggested by sf-bilbo@SF).
; 2001/07/12 - Bug #440763: file reading routine no longer needs a matching
;                           file name, check has been added to see if file
;                           exists
; 2001/06/26 - Bug #437442: fixed double slash problem
;            - Bug #437441: if the '-unmapped' option is given on the command-
;                           line then the default desktop configuration is 
;                           loaded.
;            - Only save visible frames (needed to fix bug #437441)
; 2001/05/06 - Added dta-switch-session which kills all buffers before loading
;              a new session
; 2001/05/01 - Saving of sessions no longer creates backup files.  File name 
;              completion at session save no longer needs a match.
; 2001/04/16 - Initial check-in on SF.

;;; Code:

;; === User definable variables ===

(defgroup desktopaid nil
  "The Desktop Aid customization group."
  :group 'convenience
  :group 'environment)

(defcustom dta-max-history-length 10
  "Maximum history length (in number of elements) to be saved.
If this value is nil then all history elements will be saved."
  :type '(integer)
  :group 'desktopaid)

(defcustom dta-cfg-dir "~/.desktopaid/"
  "Directory into which all configuration files of Desktop Aid are written.
This string should end with a '/'."
  :type '(directory)
  :group 'desktopaid)

(defcustom dta-default-cfg "default.conf"
  "File name of the default configuration file.  This is the file that will
be used by the auto save/restore functionality."
  :type '(file)
  :group 'desktopaid)

(defcustom dta-default-auto t
  "Enabling this option will make the last loaded configuration file, the 
default one.  When you quit Emacs this file will then be used to save your
session and when you restart Emacs it will be used to restore your session."
  :type '(boolean)
  :group 'desktopaid)

;; === Initialisation/Termination ===

(defun dta-hook-up ()
  "Initialize Desktop Aid hooks for automatic loading/saving of sessions."
  (add-hook 'after-init-hook 'dta-init-desktopaid)
  (add-hook 'kill-emacs-hook 'dta-kill-desktopaid))

(defun dta-init-desktopaid ()
  "Initialize Desktop Aid by loading the last saved session."
  (interactive)
  (dta-load-session (if (dta-ask-config-p)
                        (dta-get-config)
                      (concat dta-cfg-dir dta-default-cfg))))

(defun dta-kill-desktopaid ()
  "Called when Emacs is being exited, saves the current session."
  (interactive)
  (dta-save-session (concat dta-cfg-dir dta-default-cfg))
  (customize-save-customized))

;; === Saving ===

(defun dta-save-session (file-name)
  "Save a list of valid buffers.
The scratch buffer, completion buffers, etc are invalid."
  (interactive (list (dta-get-config)))
  (save-excursion
    (if dta-default-auto
        (customize-set-variable 'dta-default-cfg 
                                (file-name-nondirectory file-name)))
    (let ((out (generate-new-buffer "desktopaid.temp")))
      (set-buffer out)
      (set-visited-file-name file-name)
      (dta-save-buffer-list out file-name)
      (dta-save-frame-list out)
      (dta-save-history out)
      (save-buffer 0)
      (kill-buffer out))))

(defun dta-save-buffer-list (out &optional file-name)
  "Saves the list of buffers being visited in the 'out'-stream.
The given file-name is excluded from the save list."
  (let ((bl (buffer-list))
        (tosave nil))
    (while bl
      (if (dta-is-valid-buffer-p (car bl))
          (if (not (equal (buffer-file-name (car bl))
                          (expand-file-name file-name)))
              (setq tosave (cons (cons (buffer-file-name (car bl))
                                       (dta-get-point (car bl)))
                                 tosave))))
      (setq bl (cdr bl)))
    (print tosave out)))

;(defun dta-get-window-list ()
;  (interactive)
;  (let ((windows nil))
;    (walk-windows (lambda (window) 
;                    (setq windows (cons window windows)))
;                  "no-mini-buf"
;                  'visible)))

(defun dta-save-frame-list (out)
  "Saves information about the frames in the 'out'-stream."
  (let ((fl (visible-frame-list))
        (tosave nil))
    (while fl
      (let* ((frame (car fl))
             (params (frame-parameters frame))
             (fx (cdr (assoc 'left params)))
             (fy (cdr (assoc 'top params)))
             (fw (cdr (assoc 'width params)))
             (fh (cdr (assoc 'height params)))
             (ffn (buffer-file-name (window-buffer (frame-selected-window frame)))))
        (setq tosave (cons (list fw fh fx fy ffn)
                           tosave)))
      (setq fl (cdr fl)))
    (print tosave out)))

(defun dta-save-history (out)
  "Saves some of the minibuffer history variables."
  ;; File name history
  (print (dta-trim-list dta-max-history-length
                        file-name-history)
         out))
  
;; === Loading ===

(defun dta-load-session (file-name)
  "Reloads the files that are specified in given file-name."
  (interactive (list (dta-get-config)))
  (if (file-exists-p file-name)
      ;; Ok file exists
      (save-excursion
        (if dta-default-auto
            (customize-set-variable 'dta-default-cfg 
                                     (file-name-nondirectory file-name)))
        (let ((in (find-file file-name)))
          (set-buffer in)
          (goto-char (point-min))
          (setq in (dta-load-buffer-list in))
          (setq in (dta-load-frame-list in))
          (setq in (dta-load-history in))
          (kill-buffer in)))
    ;; Oops, report error
    (ding)
    (message "File does not exist: %s" file-name)))

(defun dta-switch-session (file-name)
  "Reloads the files that are specified in given file-name."
  (interactive (list (dta-get-config)))
  (if (file-exists-p file-name)
      ;; Ok file exists
      (let ((bl (buffer-list)))
        (if dta-default-auto
            ;; First save current session in default configuration
            (dta-save-session (concat dta-cfg-dir dta-default-cfg)))
        ;; Now kill all existing buffers
        (while bl
          (if (dta-is-valid-buffer-p (car bl))
              (kill-buffer (car bl)))
          (setq bl (cdr bl)))
        ;; And load new session
        (dta-load-session file-name))
    ;; Oops, report error
    (ding)
    (message "File does not exist: %s" file-name)))

(defun dta-load-buffer-list (in)
  "Loads the files from the file list specified in the 'in'-stream."
  (let ((toread (read in)))
    (while toread
      (let* ((fn (caar toread))
             (pos (cdar toread))
             (aux (find-file fn)))
        (set-buffer aux)
        (goto-char pos))
      (setq toread (cdr toread))))
  in)

(defun dta-load-frame-list (in)
  "Loads information about the frames from the 'in'-stream."
  (let* ((toread (read in))
         ;; #(new frames) = #(needed frames) - #(existing frames)
         (new-frames (- (length toread) (length (visible-frame-list))))
         (selected nil))
    (while (> new-frames 0)
      (make-frame)
      (setq new-frames (- new-frames 1)))
    (while toread
      (let* ((params (car toread))
             (fw (nth 0 params))
             (fh (nth 1 params))
             (fx (nth 2 params))
             (fy (nth 3 params))
             (ffn (nth 4 params)))
        ;; Resize existing frame
        (setq selected (next-frame selected 'visible))
        (set-frame-size selected fw fh)
        (set-frame-position selected fx fy)
        (if ffn
            (set-window-buffer (frame-selected-window selected)
                               (find-file ffn))))
      (setq toread (cdr toread))))
  in)

(defun dta-load-history (in)
  "Saves some of the minibuffer hostory variables."
  ;; File name history
  (setq file-name-history (read in))	; File names
  in)

;; === Help functions ===

(defun dta-get-config ()
  "Asks the user for a configuration file and returns its full path."
  (let ((insert-default-directory nil))
    (concat dta-cfg-dir (read-file-name "Select configuration: "
                                        dta-cfg-dir dta-default-cfg))))

(defun dta-is-valid-buffer-p (buffer)
  "Checks whether given buffer is valid."
  (buffer-file-name buffer))

(defun dta-get-point (buffer)
  "Returns point in given buffer"
  (save-excursion
    (set-buffer buffer)
    (point)))

(defun dta-trim-list (len lst)
  "Returns list of first 'len' elements of given list."
  (if (null len)
      ;; No length given, return original list
      lst
    ;; Length given trim list
    (if (or (= len 0)
            (null lst))
        nil
      (cons (car lst) (dta-trim-list (- len 1) (cdr lst))))))

(defun dta-ask-config-p ()
  "Determines whether we should ask the user for a file name or just go
with the default one."
  (let ((args command-line-args)
        (ask t))
    (while args
      (if (equal (downcase (car args)) "-unmapped")
          (progn
            (setq ask nil)
            (setq args nil)))
      (setq args (cdr args)))
    ask))
