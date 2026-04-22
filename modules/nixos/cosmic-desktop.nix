let
  flake.modules.nixos.cosmic = {pkgs, ...}: {
    # Enable the COSMIC login manager
    # services.displayManager.cosmic-greeter.enable = true;

    # Enable the COSMIC desktop environment
    services.desktopManager.cosmic.enable = true;

    # Disable unnecessary apps
    environment.cosmic.excludePackages = with pkgs; [
      cosmic-term
      cosmic-edit
      cosmic-player
      cosmic-store
    ];
  };
in {
  inherit flake;
}
