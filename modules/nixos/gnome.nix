let
  flake.modules.nixos.gnome = {pkgs, ...}: {
    # services.displayManager.gdm.enable = true;
    services.desktopManager.gnome.enable = true;

    # To disable installing GNOME's suite of applications
    # and only be left with GNOME shell.
    services.gnome.core-apps.enable = true;
    services.gnome.core-developer-tools.enable = false;
    services.gnome.games.enable = false;
    environment.gnome.excludePackages = with pkgs; [gnome-tour gnome-user-docs];

    # Extensions
    environment.systemPackages = with pkgs; [
      gnomeExtensions.dash-to-dock
      gnomeExtensions.blur-my-shell
      gnomeExtensions.just-perfection
      gnomeExtensions.arc-menu
      gnomeExtensions.appindicator
    ];
  };
in {
  inherit flake;
}
