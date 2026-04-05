{inputs, ...}: let
  flake-file.inputs = {
    catppuccin.url = "github:catppuccin/nix/release-25.11";
  };

  flake.modules.homeManager.steve = {
    imports = [inputs.catppuccin.homeModules.catppuccin];

    catppuccin = {
      # Catppuccin core settings
      enable = false;
      flavor = "mocha";
      accent = "mauve";

      # Enabling for selected apps
      atuin.enable = true;
      bat.enable = true;
      btop.enable = true;
      lazygit.enable = true;
    };
  };
in {
  inherit flake flake-file;
}
