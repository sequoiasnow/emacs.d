(defun snow-linum-format ()
  "A simple nlinum format function which needs improvement"
  (when nlinum-mode
    (setq-local nlinum-format
                (concat " %"
                        (number-to-string
                         ;; Rough number of lines in buffer
                         (ceiling (log (max 1 (/ (buffer-size) 80)) 10))) "d "))))



(use-package nlinum
  :config
  (setq nlinum-highlight-current-line t)
  (add-hook 'prog-mode-hook 'nlinum-mode)

  ;; Remove background face in linum mode.
  (set-face-attribute 'line-humber '(:background nil))

  (when (daemonp)
    (add-hook 'window-setup-hook 'initialize-nlinum)
    (defadvice make-frame (around toggle-nlinum-mode compile activate)
      (nlinum-mode -1) ad-do-it (nlinum-mode 1)))

  (add-hook 'nlinum-mode-hook #'snow-linum-format))

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
