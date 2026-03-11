# Bringing the convenience of a declarative system approach to macOS
{inputs, ...}: let
  flake-file.inputs = {
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
  };

  flake.modules.darwin.nix-darwin = {pkgs, ...}: {
    environment.systemPackages = with inputs.nix-darwin.packages.${pkgs.stdenv.hostPlatform.system}; [
      darwin-option
      darwin-rebuild
      darwin-version
      darwin-uninstaller
    ];
  };
in {
  inherit flake flake-file;
}
