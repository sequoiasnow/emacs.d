(setq-default
 blink-matching-paren nil
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil
 indicate-buffer-boundaries nil
 indicate-empty-lines nil
 ;; No more distracting sounds and lights.
 ring-bell-function #'ignore
 visible-bell nil
 ;; No more rediculous startup screen
 inhibit-startup-screen t
 ;; Spaces are better than tabs
 indent-tabs-mode nil
 ;; I'm picky about my tabs
 tab-width 2)

;; Native fullscreen
(setq-default ns-use-native-fullscreen t)

;; Quicker saving.
(fset 'yes-or-no-p 'y-or-n-p)

;; No GUI elements left
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

(defun snow-ui|toggle-transparency ()
  (interactive)
  (let ((alpha (frame-parameter nil 'alpha)))
    (set-frame-parameter
     nil 'alpha
     (if (eql (cond ((numberp alpha) alpha)
                    ((numberp (cdr alpha)) (cdr alpha))
                    ;; Also handle undocumented (<active> <inactive>) form.
                    ((numberp (cadr alpha)) (cadr alpha)))
              100)
         '(85 . 50) '(100 . 100)))))
(global-set-key (kbd "C-c t") 'snow-ui|toggle-transparency)

(provide 'core-ui)
