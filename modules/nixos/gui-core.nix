let
  flake.modules.nixos.gui-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alacritty
      gimp
      picard
      audacious
    ];
  };
in {
  inherit flake;
}
