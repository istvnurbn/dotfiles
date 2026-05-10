# [TODO] Add in betterfox-nix module
# [TODO] Switch to Brave Origin once available
# [TODO] Switch to oxcl/nix-flake-helium-browser
{inputs, ...}: let
  flake-file.inputs.helium = {
    url = "github:schembriaiden/helium-browser-nix-flake";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.browsers = {pkgs, ...}: {
    # Install firefox.
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.helium.packages.${stdenv.hostPlatform.system}.default
      brave
    ];
  };
in {
  inherit flake flake-file;
}
