{inputs, ...}: let
  flake-file.inputs.helium = {
    url = "github:schembriaiden/helium-browser-nix-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.browsers = {pkgs, ...}: {
    # Install firefox.
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      brave
      inputs.helium.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
in {
  inherit flake flake-file;
}
