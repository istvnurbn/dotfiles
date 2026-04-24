{inputs, ...}: let
  flake-file.inputs.noctalia = {
    url = "github:noctalia-dev/noctalia-shell";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.niri = {pkgs, ...}: {
    imports = [inputs.noctalia.nixosModules.default];

    programs.niri.enable = true;

    environment.systemPackages = with pkgs; [
      inputs.noctalia.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
  };
in {
  inherit flake flake-file;
}
