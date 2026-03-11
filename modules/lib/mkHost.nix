# Helper function for creating NixOS/Darwin-system
# Used in ../hosts/host-configurations.nix
{
  inputs,
  lib,
  ...
}: let
  flake.lib.mkHost = {
    inherit mkNixos mkDarwin;
    inherit linux linux-arm;
    inherit darwin darwin-intel;
  };

  linux = mkNixos "x86_64-linux";
  linux-arm = mkNixos "aarch64-linux";

  darwin-intel = mkDarwin "x86_64-darwin";
  darwin = mkDarwin "aarch64-darwin";

  # Importing host specific modules for macOS systems
  # and setting the correct host platform
  mkDarwin = system: name:
    inputs.nix-darwin.lib.darwinSystem {
      inherit system;
      modules = [
        inputs.self.modules.darwin.${name}
        {
          nixpkgs.hostPlatform = lib.mkDefault system;
        }
      ];
    };

  # Importing host specific modules for macOS systems
  # and setting the correct host platform
  mkNixos = system: name:
    inputs.nixpkgs.lib.nixosSystem {
      inherit system;
      modules = [
        inputs.self.modules.nixos.${name}
        {
          nixpkgs.hostPlatform = lib.mkDefault system;
        }
      ];
    };
in {
  inherit flake;
}
