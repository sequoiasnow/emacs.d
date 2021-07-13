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
              (setq-default exec-path '("/usr/local/bin"
                                        "/usr/local/sbin"
                                        "/Users/sequoiasnow/.cargo/bin"
                                        "/Users/sequoiasnow/lib/googke-cloud-sdk/bin"
                                        "/Users/sequoiasnow/.bin/"
                                        "/Users/sequoiasnow/.local/bin/"
                                        "/Users/sequoiasnow/.ghcup/bin"
                                        "/Users/sequoiasnow/go/bin"
                                        "/Library/TeX/texbin/"
                                        "/usr/bin"
                                        "/usr/sbin"
                                        "/bin"
                                        "/sbin"))
              (setenv "PATH"  (mapconcat 'identity exec-path ":"))
              ))))

(provide 'core-os)
