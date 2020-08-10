(use-package rust-mode
  :defer t
  :config
  (add-hook 'rust-mode-hook
            (lambda ()
              (local-set-key (kbd "C-c <tab>") #'rust-format-buffer))))

(use-package cargo
  :defer t
  :config
  (add-hook 'rust-mode-hook 'cargo-minor-mode))

(use-package racer
  :defer t
  :init
  (setq racer-cmd "~/.cargo/bin/racer") ;; Rustup binaries PATH
  (setq racer-rust-src-path "~/Code/rust/src") ;; Rust source code PATH

  (add-hook 'rust-mode-hook #'racer-mode)
  (add-hook 'racer-mode-hook #'eldoc-mode)
  (add-hook 'racer-mode-hook #'company-mode))

(use-package flycheck-rust
  :defer t
  :config
  (add-hook 'flycheck-mode-hook #'flycheck-rust-setup))
