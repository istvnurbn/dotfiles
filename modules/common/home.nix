# User environment management with Nix
{inputs, ...}: let
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  flake.modules.darwin.home = {
    imports = [inputs.home-manager.darwinModules.home-manager];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };
  flake.modules.nixos.home = {
    imports = [inputs.home-manager.nixosModules.home-manager];
    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.backupFileExtension = "backup";
  };
in {
  inherit flake flake-file;
}
