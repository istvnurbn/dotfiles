let
  flake.modules.nixos.coolercontrol = {pkgs, ...}: {
    programs.coolercontrol.enable = true;

    environment.systemPackages = with pkgs; [coolercontrol.coolercontrol-gui];
  };
in {
  inherit flake;
}
