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
      emacsEnv
      openssh
      perl532Packages.NetOpenSSH
    ];
    meta.priority = 0;
  };
  haskellDev = with self.haskellPackages; super.buildEnv {
      name = "haskellDev";
      paths =
        let
          callLocalHaskPkg =
            path: self.haskellPackages.callPackage path {};
          localPkgs = builtins.map callLocalHaskPkg [
            ../expressions/hindent
          ];
        in with self.pkgs; [
          cabal2nix
          ghc
          cabal-install
          ghcid
        ] ++ localPkgs;
      meta.priority = 1;
  };
}
