;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
                                        ; (package-initialize)

(require 'core (concat user-emacs-directory "core/core"))

;; In the words of Tim Alan, "Never Give Up. Never Surrender!"
(snow! :lang
       clojure
       haskell
       markdown
       swift
       typescript
       web
       elixir
       rust
       c

       :feature
       evil
       aggressive-indent
       paredit
       company
       ivy
       yasnippet
       eldoc
       dired
       git
       flycheck
       pacman
       xkcd
       dash
       org

       :ui
       theme
       neotree
       modeline
       nlinum)
