let
  flake.modules.nixos.devel = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      git-credential-manager
      zed-editor
    ];
  };
in {
  inherit flake;
}
