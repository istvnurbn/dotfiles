let
  flake.modules.nixos.gui-core = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      alacritty
      ghostty
      bitwarden-desktop
      proton-pass
      gimp
      picard
    ];

    services.flatpak.packages = [
      "com.github.tchx84.Flatseal"
      "org.atheme.audacious"
    ];
  };
in {
  inherit flake;
}
