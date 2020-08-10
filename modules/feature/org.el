;; Improve the org todo experience
(setq org-todo-keyowrds
      '((sequence "TODO(t)" "PROGRESS(p)" "|" "DONE(d)" "CANCELED(c)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)"))
      org-log-done 'note)

;; Add latext to load path
(setq exec-path (append exec-path '("/Library/TeX/texbin")))

;; Allow latex math to be pretty!
(setq org-latex-create-formula-image-program 'dvisvgm)

;; Allow some more literate programming.
(setq org-src-fontify-natively t)

(custom-set-faces
 '(org-block-begin-line nil)
 '(org-block nil)
 '(org-block-end-line nil))

;; Allow editing in Olivetti mode
(use-package olivetti
  :defer t)

;; Set markdown line spacing to be a bit more generous, and center the cursor
;; in the screen.
(defun setup-orgmode-editing ()
  (olivetti-mode)
  (visual-line-mode)
  (setq line-spacing 6))

(add-hook 'org-mode-hook 'setup-orgmode-editing)
