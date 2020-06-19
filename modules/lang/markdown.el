(use-package centered-cursor-mode)

(use-package markdown-mode :mode "\\.md$"
  :config
  (add-hook 'markdown-mode-hook 'flyspell-mode))

(use-package edit-indirect)

(set-face-attribute 'markdown-pre-face nil
                    :inherit nil
                    :background nil)
(set-face-attribute 'markdown-code-face nil
                    :inherit nil
                    :background nil)
(set-face-attribute 'edit-indirect-edited-region nil
                    :inherit nil
                    :background nil)


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
