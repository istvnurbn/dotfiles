let
  flake.modules.nixos.gui-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
      gimp
      picard
      libreoffice
      proton-pass
      bitwarden-desktop
      vlc
    ];

    services.flatpak.packages = [
      "com.jeffser.Nocturne"
    ];
  };
in {
  inherit flake;
}
