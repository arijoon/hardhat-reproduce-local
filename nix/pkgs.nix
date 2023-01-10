let 
  overlays = [
    (self: super: { nix-filter = (import ./nix-filter.nix); })
    (self: super: { yarn-nixify = super.callPackage (import ./yarn-nixify.nix) {}; })
    (self: super: { yarn-berry = super.callPackage (import ./yarn-berry.nix) {}; })
    (self: super: { my-project = super.callPackage (import ../package.nix) {}; })
  ];
in
  import <nixpkgs> {
    inherit overlays;
  }