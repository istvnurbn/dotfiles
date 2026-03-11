# Inputs not declared anywhere else
{
  flake-file.inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-lib.follows = "nixpkgs";

    flake-parts = {
      url = "github:hercules-ci/flake-parts";
      inputs.nixpkgs-lib.follows = "nixpkgs-lib";
    };

    import-tree.url = "github:vic/import-tree";

    flake-file.url = "github:vic/flake-file";
  };
}
