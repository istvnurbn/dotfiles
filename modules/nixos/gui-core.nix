let
  flake.modules.nixos.gui-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alacritty
      ghostty
      bitwarden-desktop
      proton-pass
      gimp
      picard
      audacious
    ];
  };
in {
  inherit flake;
}
