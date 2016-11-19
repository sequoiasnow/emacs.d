;; Handels the display of org mode to be more conveniant.
;; source @ http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html

(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)

;; These are the files emacs searches for global actions
(setq org-agenda-files (list "~/org/work.org"
                             "~/org/school.org" 
                             "~/org/home.org"))

(provide 'org-mode)
