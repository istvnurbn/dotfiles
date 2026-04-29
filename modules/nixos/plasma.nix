# [TODO] Implement plasma-manager via Home Manager
let
  flake.modules.nixos.plasma = {pkgs, ...}: {
    # Enable the KDE Plasma Desktop Environment.
    services.displayManager.sddm.enable = true;
    services.desktopManager.plasma6.enable = true;

    # Disable unnecessary apps
    environment.plasma6.excludePackages = with pkgs.kdePackages; [
      konsole
    ];
  };
in {
  inherit flake;
}
