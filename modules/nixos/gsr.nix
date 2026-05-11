{inputs, ...}: let
  flake-file.inputs.gsr-ui-nix = {
    url = "github:rPlakama/gsr-ui-nix";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  flake.modules.nixos.gsr = {
    imports = [inputs.gsr-ui-nix.nixosModules.default];

    programs.gpu-screen-recorder = {
      enable = true;
      ui.enable = true;
    };
  };
in {
  inherit flake flake-file;
}
