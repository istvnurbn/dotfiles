# Mac App Store apps
let
  flake.modules.darwin.masapps = {
    homebrew.masApps = {
      "Amphetamine" = 937984704;
      "Magnet" = 441258766;
    };
  };
in {
  inherit flake;
}
