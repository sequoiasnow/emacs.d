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

;; Quicker saving.
(fset 'yes-or-no-p 'y-or-n-p)

;; No GUI elements left
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)


(provide 'core-ui)
