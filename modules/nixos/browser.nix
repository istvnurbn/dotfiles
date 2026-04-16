let
  flake.modules.nixos.browsers = {pkgs, ...}: {
    # Install firefox.
    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [brave];
  };
in {
  inherit flake;
}
