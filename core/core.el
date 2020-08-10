(defvar snow-emacs-dir (expand-file-name user-emacs-directory)
  "This is the path to the emacs.d directory")

(defvar snow-core-dir (concat snow-emacs-dir "core/")
  "Location of all core files for the project")

(defvar snow-modules-dir (concat snow-emacs-dir "modules/")
  "Location of all core modules for the project")

(defvar snow-etc-dir (concat snow-emacs-dir "etc/")
  "Generic files that do not conflict with the core configuration and should
remain largelly static across uses")

(defvar snow-cache-dir (concat snow-emacs-dir "cache/")
  "Location of autosaves, game scores and all other saved meta info")

(defvar snow-packages-dir (concat snow-emacs-dir "packages")
  "Location of all packages downloaded by package.el")

;; Manage the location of autosave files
(setq-default
 ;; Don't need any backups (save with commits)
 auto-save-default nil
 create-lockfiles nil
 history-length 500
 make-backup-files nil
 ;; Get all these files away from my project
 auto-save-list-file-name     (concat snow-cache-dir "autosave")
 backup-directory-alist       (list (cons "." (concat snow-cache-dir "backup/")))
 pcache-directory             (concat snow-cache-dir "pcache/")
 server-auth-dir              (concat snow-cache-dir "server/")
 shared-game-score-directory  (concat snow-etc-dir "shared-game-score/")
 ;; Remove the stupid ad-handle-definition got redefined messages
 ad-redefinition-action 'accept
 )

;; Use zsh
(setenv "SHELL" "/bin/zsh")

;; Move custom definitions outside of init.el
(setq custom-file (concat snow-etc-dir "custom.el"))
(load custom-file t t)

;; No stupid startup window
(advice-add #'display-startup-echo-area-message :override #'ignore)
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-major-mode 'fundamental-mode
      initial-scratch-message nil)

;; Ensure we can access brew binaries
(setq exec-path (append exec-path '("/usr/local/bin")))
(setenv "PATH" (concat (getenv "PATH") ":/usr/local/bin"))

;; Ensure we can access haskell binaries
(add-to-list 'exec-path (expand-file-name "~/.cabal/bin"))
(add-to-list 'exec-path (expand-file-name "~/.local/bin"))

;; Define the startup time:
(defun snow|startup-time ()
  (interactive)
  (print (format "%.2f seconds"
                 (float-time
                  (time-subtract after-init-time before-init-time)))))

;; Allow the loading of the files.
(require 'cl-lib)
(require 'core-packages (concat snow-core-dir "core-packages"))


;; Let's get the ball rolling
(snow-initialize)

;; Here goes nothing...
(require 'core-lib)
(require 'core-os)
(require 'core-editing)
(require 'core-ui)

(provide 'core)
