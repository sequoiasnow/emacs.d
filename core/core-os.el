;; TODO Eventually add support for linux.
(cond ((eq system-type 'darwin) ;; Mac
       (setq ;; Better scrolling support
             mac-redisplay-dont-reset-vscroll t
             mac-mouse-wheel-smoth-scroll nil
             mouse-wheel-scroll-amount '(5 ((shift) . 2)) ; One line at a time
             mouse-wheel-progressive-speed nil)
       (cond ((display-graphic-p)
              ;; This sets the PATH variables correctly for non terminal-based
              ;; emacs environments. 
              (use-package exec-path-from-shell 
                           :config (exec-path-from-shell-initialize))))))

(provide 'core-os)
