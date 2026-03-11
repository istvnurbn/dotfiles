# TUI utilities not available in nixpkgs
# [TODO] Periodically check whether these are available in nixpkgs
let
  flake.modules.darwin.brews = {
    homebrew.brews = [
      "imessage-exporter"
      "mas"
      "mole"
    ];
  };
in {
  inherit flake;
}
