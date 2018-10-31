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


;; Setup latex properly
(require 'ox-latex)
(unless (boundp 'org-latex-classes)
  (setq org-latex-classes nil))

;; Sample article
(add-to-list 'org-latex-classes
             '("article"
               "\\documentclass{article}
                  \\usepackage{amsmath}
                  \\usepackage{amssymb}
                  \\usepackage{mathrsfs}
               [NO-DEFAULT-PACKAGES]
               [NO-PACKAGES]"
               ("\\section{%s}" . "\\section*{%s}")
               ("\\subsection{%s}" . "\\subsection*{%s}")
               ("\\paragraph{%s}" . "\\paragraph*{%s}")
               ("\\subparagraph{%s}" . "\\subparagraph*{%s}")))
