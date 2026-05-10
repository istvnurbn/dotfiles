# User environment management with Nix
{inputs, ...}: let
  flake-file.inputs = {
    home-manager.url = "github:nix-community/home-manager/release-25.11";
  };

  flake.modules.darwin.home = {
    imports = [
      inputs.home-manager.darwinModules.home-manager
      common
    ];
  };

  flake.modules.nixos.home = {
    imports = [
      inputs.home-manager.nixosModules.home-manager
      common
    ];
  };

  # Common settings across NixOS and macOS
  common = {
    home-manager = {
      useGlobalPkgs = true;
      useUserPackages = true;
      backupFileExtension = "backup";
    };
  };
in {
  inherit flake flake-file;
}
