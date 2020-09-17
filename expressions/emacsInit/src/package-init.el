;; Workaround for initializing packages
(setq tmp-dir default-directory)
(setq default-directory "~/.nix-profile/share/emacs/site-lisp/elpa")
(normal-top-level-add-subdirs-to-load-path)
(setq default-directory tmp-dir)
