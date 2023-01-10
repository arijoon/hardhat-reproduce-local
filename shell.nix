let
  pkgs = import ./nix/pkgs.nix;
  inherit (pkgs);
in
  pkgs.mkShell {
    buildInputs = with pkgs; [
      nodejs
      yarn-berry
    ];

    shellHook = ''
      export YARN_PLUGINS=${pkgs.yarn-nixify}
    '';
  }
