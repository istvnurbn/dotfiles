# Nix settings for all systems
let
  flake.modules.nixos = {inherit nix-settings;};
  flake.modules.darwin = {inherit nix-settings;};

  nix-settings = {pkgs, ...}: {
    nix = {
      settings = {
        nix-path = ["nixpkgs=${pkgs.path}"];

        # Users and groups that have additional rights when connecting to the Nix daemon
        trusted-users = [
          "steve"
          "@wheel"
        ];

        # Necessary for using flakes on this system
        experimental-features = ["nix-command flakes"];

        # Do not warn about dirty Git/Mercurial trees
        warn-dirty = false;

        # Nix automatically detects files in the store that have identical contents, and replaces them with hard links
        auto-optimise-store = !pkgs.stdenv.hostPlatform.isDarwin;

        # List of binary cache URLs used to obtain pre-built binaries of Nix packages
        substituters = [
          "https://cache.nixos.org/"
          "https://nix-community.cachix.org"
          "https://nixpkgs-unfree.cachix.org"
        ];

        trusted-public-keys = [
          "cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY="
          "nix-community.cachix.org-1:mB9FSh9qf2dCimDSUo8Zy7bkq5CX+/rkCWyvRCYg3Fs="
          "nixpkgs-unfree.cachix.org-1:hqvoInulhbV4nJ9yJOEr+4wxhDV4xq2d1DK7S6Nj6rs="
        ];
      };

      # Do garbage collection to keep disk usage low
      gc = {
        automatic = true;
        interval = {
          Hour = 3;
          Minute = 15;
        };
        options = "--delete-older-than 7d";
      };

      # From https://jackson.dev/post/nix-reasonable-defaults/
      optimise.automatic = true;
      extraOptions = ''
        connect-timeout = 5
        min-free = 128000000
        max-free = 1000000000
        fallback = true
      '';
    };

    nixpkgs.config = {
      # Allow non-free packages
      allowUnfree = true;

      # A lot of stuff says it doesn't work on aarch64-darwin, but it actually does.
      allowUnsupportedSystem = true;
    };
  };
in {
  inherit flake;
}
