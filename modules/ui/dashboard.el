(use-package page-break-lines)

(use-package dashboard
  :after page-break-lines
  :config
  (dashboard-setup-startup-hook))
