self: super: {
  emacsEnv = super.buildEnv {
    name = "emacsEnv";
    paths =
      (with self;
        [ emacs26 ]) ++
      [ (import ../expressions/myEmacsFonts.nix)
        (import ../expressions/myEmacsInit) ] ++
      (with self.emacs26Packages;
      [ ahk-mode
        column-enforce-mode
        eshell-git-prompt
        csharp-mode
        highlight-indent-guides
        solarized-theme
        impatient-mode
        ivy
        swiper
        counsel
        magit
        projectile
        counsel-projectile
        multiple-cursors
        avy
        hydra
        rust-mode
        highlight-function-calls
        org-tree-slide
        org
        expand-region
        ox-reveal
        s
        dash
        forge
        doom-themes
        ivy-posframe
        doom-modeline
        nix-mode
      ]);
    meta.priority = 1;
  };
}
