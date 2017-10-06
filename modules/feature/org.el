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

