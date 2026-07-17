let
  flake.modules.nixos.networking = {
    # Enable networking
    networking.networkmanager.enable = true;

    # Enable the firewall
    networking.firewall.enable = true;

    services.avahi = {
      enable = true;
      openFirewall = true;
      nssmdns4 = true;
      publish = {
        enable = true;
        addresses = true;
      };
    };
  };
in {
  inherit flake;
}
