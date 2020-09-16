self: super: {
  # self or super here?
  # RULE: All functions use super
  desktop = super.buildEnv {
    name = "desktop";
    paths = with self.pkgs; [
      nix
      cacert
      tree
      haskellDev
    ];
    meta.priority = 0;
  };
  haskellDev = with self.haskellPackages; super.buildEnv {
      name = "haskellDev";
      paths = with self.pkgs; [
          ghc
          cabal-install
        ] ++ (with haskellPackages; [
          ghcid
        ]);
  };
}
