# This is a minimal `default.nix` by yarn-plugin-nixify. You can customize it
# as needed, it will not be overwritten by the plugin.

{ pkgs ? (import ./nix/pkgs.nix) }:
with pkgs;
let
  yarn = yarn-berry;

  project = callPackage ./yarn-project.nix {

    # Example of selecting a specific version of Node.js.
    nodejs = nodejs;
    yarn-berry = yarn;

  } {

    yarnPluginsPaths = pkgs.yarn-nixify;

    # Example of providing a different source tree.
    src = nix-filter  {
      root = ./.;
      include = [
        "contracts"
        "scripts"
        "test"
        "hardhat.config.ts"
        "tsconfig.json"
      ];
    };
  };

in project.overrideAttrs (oldAttrs: {
  symlinkPackages = false;
  inputsFrom = [nodejs yarn python3 coreutils];

  postInstall = ''
    export HOME=$home
    # export __HARDHAT_ALLOW_NON_LOCAL_INSTALLATION="true"
    ${yarn}/bin/yarn compile --force --verbose
    ${yarn}/bin/yarn hardhat test
    ${yarn}/bin/yarn ts-node scripts/deploy.ts
  '';
})
