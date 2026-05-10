let
  flake.modules.nixos.tailscale = {
    # Enabling tailscale
    services.tailscale = {
      enable = true;

      # Disabling logging and telemetry
      extraDaemonFlags = ["--no-logs-no-support"];
    };

    # Firewall settings for Tailscale
    networking = {
      firewall = {
        allowedUDPPorts = [41641];
        trustedInterfaces = ["tailscale0"];
      };
    };
  };
in {
  inherit flake;
}
