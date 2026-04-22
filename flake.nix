# DO-NOT-EDIT. This file was auto-generated using github:vic/flake-file.
# Use `nix run .#write-flake` to regenerate it.
{
  description = "istvnurbn's Nix Environment";

  outputs = inputs: inputs.flake-parts.lib.mkFlake { inherit inputs; } (inputs.import-tree ./modules);

  inputs = {
    boring-notch = {
      url = "github:TheBoredTeam/homebrew-boring-notch";
      flake = false;
    };
    catppuccin.url = "github:catppuccin/nix/release-25.11";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    dtop.url = "github:amir20/dtop";
    flake-file.url = "github:vic/flake-file";
    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    import-tree.url = "github:vic/import-tree";
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel?rev=a26503528b4a4ab7310c6167da549f8fbee91f30";
    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
      inputs.nixpkgs.follows = "nixpkgs-darwin";
    };
    nix-flatpak.url = "github:gmodena/nix-flatpak";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    nixpkgs-lib.follows = "nixpkgs";
    noctalia = {
      url = "github:noctalia-dev/noctalia-shell?tag=v4.7.6";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    scopebuddy.url = "github:HikariKnight/ScopeBuddy";
    xykong = {
      url = "github:xykong/homebrew-tap";
      flake = false;
    };
  };
}
