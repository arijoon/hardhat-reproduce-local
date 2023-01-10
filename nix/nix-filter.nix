let
  nix-filter = (builtins.fetchTarball {
    url    = "https://github.com/numtide/nix-filter/archive/3b821578685d661a10b563cba30b1861eec05748.tar.gz";
    sha256 = "sha256:0gzx750j06f0j1wi006rhb1xhxaszlbqi7vg0cysrffvgwjccb26";
  });
in
  import nix-filter
