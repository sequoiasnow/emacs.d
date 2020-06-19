;; Improve the org todo experience
(setq org-todo-keyowrds
      '((sequence "TODO(t)" "PROGRESS(p)" "|" "DONE(d)" "CANCELED(c)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)"))
      org-log-done 'note)

;; Add latext to load path
(setq exec-path (append exec-path '("/Library/TeX/texbin")))

;; Allow latex math to be pretty!
(setq org-latex-create-formula-image-program 'dvisvgm)

;; Allow C complilation
(org-babel-do-load-languages
 'org-babel-load-languages '((C . t)))

;; Allow some more literate programming.
(setq org-src-fontify-natively t)

(custom-set-faces
 '(org-block-begin-line nil)
 '(org-block nil)
 '(org-block-end-line nil))

;; Set markdown line spacing to be a bit more generous, and center the cursor
;; in the screen.
(defun setup-orgmode-editing ()
  (centered-cursor-mode)
  (writeroom-mode)
  (visual-line-mode)
  (setq line-spacing 6))

(add-hook 'org-mode-hook 'setup-orgmode-editing)

