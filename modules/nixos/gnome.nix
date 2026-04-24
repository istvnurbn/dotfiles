let
  flake.modules.nixos.gnome = {pkgs, ...}: {
    services = {
      displayManager.gdm.enable = true;
      desktopManager.gnome.enable = true;
    };

    # To disable installing GNOME's suite of applications
    # and only be left with GNOME shell.
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [
      gnome-tour
      gnome-user-docs
      gnome-music
      gnome-terminal
      gnome-software
      gnome-secrets
      epiphany
      geary
      totem
    ];

    # Extensions
    environment.systemPackages = with pkgs; [
      adwaita-icon-theme
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
      gnomeExtensions.arc-menu
      gnomeExtensions.appindicator
    ];

    # Temporary fix for blank windows
    environment.variables = {
      GSK_RENDERER = "ngl";
    };
  };
in {
  inherit flake;
}
