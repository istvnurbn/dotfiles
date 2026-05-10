let
  flake.modules.nixos.networking = {
    # Enable networking
    networking.networkmanager.enable = true;

    # Enable the firewall
    networking.firewall.enable = true;
  };
in {
  inherit flake;
}
