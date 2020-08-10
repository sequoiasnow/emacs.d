(setq-default
 blink-matching-paren nil
 cursor-in-non-selected-windows nil
 highlight-nonselected-windows nil
 indicate-buffer-boundaries t
 indicate-empty-lines nil
 ;; No more distracting sounds and lights.
 ring-bell-function #'ignore
 visible-bell nil
 ;; No more rediculous startup screen
 inhibit-startup-screen t
 ;; Spaces are better than tabs
 indent-tabs-mode nil
 ;; I'm picky about my tabs
 tab-width 2
 ;; remove continuation arrow on right fringe
 fringe-indicator-alist (delq (assq 'continuation fringe-indicator-alist)
                              fringe-indicator-alist))

;; Remove the window-frame
(setq-default window-divider-default-places t
              window-divider-default-bottom-width 0
              window-divider-default-right-width 1)
(window-divider-mode)

;; Ensure natural titlebar
(add-to-list 'default-frame-alist
             '(ns-transparent-titlebar . t))

;; Remove titlebar info
(setq ns-use-proxy-icon nil)
(setq-default frame-title-format nil)

;; Native fullscreen
(setq-default ns-use-native-fullscreen t
              mac-use-native-fullscreent t)

(defun toggle-fullscreen ()
  (interactive)
  (set-frame-parameter nil 'fullscreen
                       (when (not (frame-parameter nil 'fullscreen)) 'fullscreen)))


(defun snow-ui|no-fringes-in-minibuffer ()
  "Disable fringes in the minibuffer window."
  (set-window-fringes (minibuffer-window) 0 0 nil))
(add-hook 'minibuffer-setup-hook #'snow-ui|no-fringes-in-minibuffer)


;; Quicker saving.
(fset 'yes-or-no-p 'y-or-n-p)

;; No GUI elements left
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;; Simple fix for frozen emacs shell
(defun snow|eshell-clear ()
  "Clear the eshell buffer."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

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
(global-set-key (kbd "C-c C-t") 'snow-ui|toggle-transparency)

;; Set the default font.
(add-to-list 'default-frame-alist '(font . "SF Mono"))

(provide 'core-ui)
