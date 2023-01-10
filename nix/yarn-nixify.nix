{
  fetchurl,
}:
let
  nixify = fetchurl {
    url = "https://raw.githubusercontent.com/rhinofi/yarn-plugin-nixify/allow-passing-wrapped-yarn-berry/dist/yarn-plugin-nixify.js";
    sha256 = "sha256-XzZEtHVHcidKKH4jRdHYsVv+Q8xkwldFFgOXc+F+zSQ=";
  };
in
  nixify