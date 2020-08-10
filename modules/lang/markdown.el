(use-package markdown-mode
  :mode "\\.md$"
  :defer t
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode)
  (set-face-attribute 'markdown-pre-face nil
                      :inherit nil
                      :background nil)
  (set-face-attribute 'markdown-code-face nil
                      :inherit nil
                      :background nil)
  (set-face-attribute 'edit-indirect-edited-region nil
                      :inherit nil
                      :background nil))

(use-package edit-indirect :defer t)


;; Set markdown line spacing to be a bit more generous, and center the cursor
;; in the screen.
;; (defun set-markdown-editing ()
;;   ;; Set the font
;;   (setq buffer-face-mode-face '(:family "Courier"))
;;   (buffer-face-mode)
;;   (centered-cursor-mode)
;;   (setq writeroom-fringes-outside-margins t)
;;   (writeroom-mode)
;;   (setq line-spacing 6))
