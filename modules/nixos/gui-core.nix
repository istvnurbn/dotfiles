let
  flake.modules.nixos.gui-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      ghostty
      gimp
      picard
      libreoffice
      proton-pass
      bitwarden-desktop
    ];
  };
in {
  inherit flake;
}
