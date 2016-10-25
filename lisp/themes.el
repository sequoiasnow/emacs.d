;; Define some custom themes to use and set the current one. This
;; standardizes the look of emacs through all projects.

;; Add sublime themes, these include many default themes added in
;; Sublime Text (2+)
(ensure-package-installed 'sublime-themes
                          'color-theme-sanityinc-tomorrow)

;; Treat all future themes as safe from now on.
(setq custom-safe-themes t)

;; Activate the current theme for emacs.
(load-theme 'spolsky t)
