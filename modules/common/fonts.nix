# Fonts
let
  flake.modules.nixos = {inherit fonts;};
  flake.modules.darwin = {inherit fonts;};

  fonts = {pkgs, ...}: {
    fonts.packages = with pkgs; [
      nerd-fonts.zed-mono
      meslo-lgs-nf
      ibm-plex
      fira-sans
      fira-code
      source-serif-pro
      source-sans-pro
      source-code-pro
      inter
      maple-mono.truetype
      maple-mono.NF-unhinted
    ];
  };
in {
  inherit flake;
}
