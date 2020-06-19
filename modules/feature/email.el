;; Get the installed mu4e code
(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'mu4e)

;; Add evil keybindings
(use-package evil-mu4e)


(setq mu4e-contexts
      `( ,(make-mu4e-context
           :name "7mind"
           :match-func (lambda (msg) (when msg
                                       (string-prefix-p "/7mind" (mu4e-message-field msg :maildir))))
           :vars '((mu4e-trash-folder . "/7mind/[Gmail].Trash")
                   (mu4e-refile-folder . "/7mind/[Gmail].Archive")))))

(setq mu4e-html2text-command "html2text -utf8 -nobs -width 72")
