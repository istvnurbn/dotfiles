let
  flake.modules.nixos.browsers = {
    # Install firefox.
    programs.firefox.enable = true;

    # programs.chromium = {
    #   enable = true;
    #   package = pkgs.brave;
    # };
  };
in {
  inherit flake;
}
