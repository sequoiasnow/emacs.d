
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'org-install)
(require 'ob-tangle)
(org-babel-load-file (expand-file-name "config.org" user-emacs-directory))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(haskell-process-auto-import-loaded-modules t)
 '(haskell-process-log t)
 '(haskell-process-suggest-remove-import-lines t)
 '(haskell-process-type (quote stack-ghci))
 '(haskell-tags-on-save t)
 '(package-selected-packages
   (quote
    (evil-vimish-fold atom-one-dark-theme twilight-theme tide rainbow-mode writeroom-mode solarized-theme color-theme-solarized scss-mode sass-mode monokai-theme color-theme-monaki color-theme-monokai apib-mode restclient alchemist elixir-mode highlight2clipboard swift3-mode json-mode vim-empty-lines-mode yasnippet yaml-mode web-mode swift-mode sublime-themes stylus-mode spaceline smooth-scrolling rust-mode rainbow-delimiters php-extras pastels-on-dark-theme paredit mmm-mode markdown-mode magit helm graphql-mode flycheck-elm evil elm-mode dockerfile-mode company-ghc color-theme-sanityinc-tomorrow cider aggressive-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
