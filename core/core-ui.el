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

;; Highlight the current line
(use-package hl-line
  :after evil
  :init (progn
          (add-hook 'linum-mode 'hl-line-mode)
          (add-hook 'nlinum-mode 'hl-line-mode))
  :config (progn
            ;; only show hl-line in sleected window
            (setq hl-line-sticky-flag nil
                  global-hl-line-sticky-flag nil)
            ;; Initially enable hl-line
            (global-hl-line-mode 1)
            ;; Don't highlight the line in visual mode
            (add-hook 'evil-visual-state-entry-hook (lambda ()
                                                      (hl-line-mode -1)))
            (add-hook 'evil-visual-state-exit-hook 'hl-line-mode)))

;; Setup line numbers with nlinum mode
(defun initialize-nlinum (&optional frame)
  (require 'nlinum)
  (setq nlinum-highlight-current-line t)
  (add-hook 'prog-mode-hook 'nlinum-mode))
(when (daemonp)
  (add-hook 'window-setup-hook 'initialize-nlinum)
  (defadvice make-frame (around toggle-nlinum-mode compile activate)
    (nlinum-mode -1) ad-do-it (nlinum-mode 1)))

(defun snow-linum-format ()
  "A simple nlinum format function which needs improvement"
  (when nlinum-mode
    (setq-local nlinum-format
                (concat "%"
                        (number-to-string
                         ;; Rough number of lines in buffer
                         (ceiling (log (max 1 (/ (buffer-size) 80)) 10))) "d"))))
(add-hook 'nlinum-mode-hook #'snow-linum-format)


;; A theme boldly stolen from someone else
(use-package doom-themes
  :config (load-theme 'doom-one t))

(provide 'core-ui)
