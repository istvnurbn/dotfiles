let
  flake.modules.nixos.localsend = {
    programs.localsend = {
      enable = true;
      openFirewall = true;
    };
  };
in {
  inherit flake;
}
