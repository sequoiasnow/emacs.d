;; Improve the org todo experience
(setq org-todo-keyowrds
      '((sequence "TODO(t)" "PROGRESS(p)" "|" "DONE(d)" "CANCELED(c)")
        (sequence "REPORT(r)" "BUG(b)" "KNOWNCAUSE(k)" "|" "FIXED(f)"))
      org-log-done 'note)

;; Allow some more literate programming.
(setq org-src-fontify-natively t)

