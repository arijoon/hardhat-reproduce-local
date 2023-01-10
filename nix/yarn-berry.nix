{
  fetchurl,
  nodejs,
  runCommandNoCC,
  name ? "yarn"
}:
let
  berry-ex = fetchurl {
    url = "https://raw.githubusercontent.com/rhinofi/yarn-berry-cjs/rhino-fork-update-3.2.1/bin/yarn";
    sha256 = "sha256-3nf/NYzEK9kc6IBJpeS2TMoxUKeb8mobIL9eaCQh3qA=";
  };
in
  runCommandNoCC
    name
    { buildInputs = [ nodejs ]; }
    ''
      binName=${name}
      binPath=$out/bin/$binName
      mkdir -p $(dirname $binPath)
      cp ${berry-ex} $binPath
      chmod +x $binPath
      patchShebangs $binPath
    ''
