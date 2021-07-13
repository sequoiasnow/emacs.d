(use-package elfeed
  :defer t
  :after evil-mode
  :config
  (setq elfeed-feeds
        '("http://planet.emacsen.org/atom.xml"
          ("https://css-tricks.com/feed/" web css programming)
          ("https://daverupert.com/atom.xml" web programming)
          ("https://macwright.com/atom.xml" web programming hills)
          ("https://wadler.blogspot.com/atom.xml" haskell programming)
          ("https://markkarpov.com/feed.atom" haskell programming)
          ("http://comonad.com/reader/feed/" haskell math)
          ("https://lexi-lambda.github.io/feeds/all.rss.xml" haskell programming)
          ("https://www.parsonsmatt.org/feed.xml" haskell programming)
          ("https://jaspervdj.be/rss.xml" haskell programming)
          ("https://www.stephendiehl.com/feed.rss" haskell programming)
          ("https://reasonablypolymorphic.com/atom.xml" haskell programming)
          ))

  (evil-set-initial-state 'elfeed-entry 'emacs)
  (evil-set-initial-state 'elfeed-show 'emacs)

  (global-set-key (kbd "C-x w") 'elfeed)
  (add-hook 'elfeed-new-entry-hook
            (elfeed-make-tagger :before "2 weeks ago"
                                :remove 'unread)))
