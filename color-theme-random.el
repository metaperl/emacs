;(require 'color-theme)
(require 'custom)

(random t)

; get themes by running (custom-available-themes)

(setq *color-theme-favorites*
  '(

abyss afternoon ahungry alect-black-alt alect-black alect-dark-alt alect-dark alect-light-alt alect-light atom-dark birds-of-paradise-plus blackboard borland-blue boron busybee chyla material-light material monokai zweilight adwaita deeper-blue dichromacy leuven light-blue manoj-dark misterioso tango-dark tango tsdh-dark tsdh-light wheatgrass whiteboard wombat

    )
  )

(defun color-theme-random()
     (interactive)

     (let* ((choice (nth (random (length *color-theme-favorites*))
			 *color-theme-favorites*)))
       (load-theme choice t)))


(defun color-theme-random-failing()
     (interactive)



     (let* ((choice (nth (random (length *color-theme-favorites*))
			 *color-theme-favorites*))
	    (fn (intern (format "color-theme-%s" choice))))
       (funcall fn)))




; http://groups.google.com/group/gnu.emacs.help/browse_thread/thread/2478d4f521d6ab82#0b238aa68c583a20

(defun time-after-seconds (seconds)
  "returns an internal emacs time that is 'seconds' seconds into the
  future."
  (seconds-to-time (+ seconds (time-to-seconds (current-time)))))


(defun timer-create-callfunc-after-seconds (func seconds)
  "run 'func' after 'seconds' seconds."
  (let ((timer (timer-create)))
    (timer-set-function timer func)
    (timer-set-time timer (time-after-seconds seconds))
    (timer-activate timer)))


(defun callfunc-random-interval (func interval-from-seconds
interval-to-seconds)
  "run 'func' with a random interval between 'interval-from-seconds'
  and
'interval-to-seconds' seconds in a infinite loop."
  (funcall func)
    (timer-create-callfunc-after-seconds
     (list 'lambda '()
           (list 'funcall ''callfunc-random-interval
                 (list 'quote func) interval-from-seconds
                 interval-to-seconds))
     (+ interval-from-seconds (random interval-to-seconds))))



(defun color-theme-random-start-cycling ()
  (interactive)
  (callfunc-random-interval 'color-theme-random (* 60 60) (* 60 360)))


(provide 'color-theme-random)
;;;
