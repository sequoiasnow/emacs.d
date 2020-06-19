(use-package load-theme-buffer-local)

;; Configure our writing environment
(use-package writeroom-mode
  :config
  (setq writeroom-width 80))

(defun snow|write-mode ()
  (interactive)
  (writeroom-mode)
  (auto-fill-mode))
