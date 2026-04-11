# nix-homebrew manages Homebrew installation on macOS using nix-darwin
{inputs, ...}: let
  flake-file.inputs = {
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    # Declarative tap management
    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };

    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };

    boring-notch = {
      url = "github:TheBoredTeam/homebrew-boring-notch";
      flake = false;
    };
  };

  flake.modules.darwin.nix-homebrew = {
    imports = [
      inputs.nix-homebrew.darwinModules.nix-homebrew
    ];

    nix-homebrew = {
      # Install Homebrew under the default prefix
      enable = true;

      # User owning the Homebrew prefix
      user = "steve";

      # Enable fully-declarative tap management
      taps = {
        "homebrew/homebrew-core" = inputs.homebrew-core;
        "homebrew/homebrew-cask" = inputs.homebrew-cask;
        "TheBoredTeam/homebrew-boring-notch" = inputs.boring-notch;
      };

      # With mutableTaps disabled, taps can no longer be added imperatively with `brew tap`.
      mutableTaps = false;
    };

    homebrew = {
      # Enable nix-darwin to manage Homebrew
      enable = true;

      # Align homebrew taps config with nix-homebrew
      taps = builtins.attrNames flake.modules.darwin.nix-homebrew.nix-homebrew.taps;

      # Disable Homebrew to auto-update itself and all formulae
      global.autoUpdate = false;

      onActivation = {
        # Disable Homebrew to auto-update itself and all formulae during nix-darwin system activation
        autoUpdate = false;

        # Packages installed outside of nix-darwin will be zapped
        cleanup = "zap";

        # Enable Homebrew to upgrade outdated formulae and Mac App Store apps during nix-darwin system activation
        upgrade = true;
      };
    };

    environment = {
      variables = {
        # Do not send analytics
        HOMEBREW_NO_ANALYTICS = "1";

        # Forbid redirects from secure HTTPS to insecure HTTP
        HOMEBREW_NO_INSECURE_REDIRECT = "1";
      };
    };
  };
in {
  inherit flake flake-file;
}
