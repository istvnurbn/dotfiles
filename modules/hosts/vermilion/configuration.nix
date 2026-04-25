# Host config for my gaming PC
{inputs, ...}: {
  flake.modules.nixos.vermilion = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      # Common modules
      # ../../common
      nix-settings
      home
      shell
      fonts
      media

      # NixOS specific modules
      # ../../nixos
      core
      security
      plymouth
      plasma
      cosmic
      pipewire
      bluetooth
      devel
      browsers
      gui-core
      gaming
      flatpak
      openrgb

      # User module
      # ../../steve
      steve
    ];

    # Use latest kernel.
    # boot.kernelPackages = pkgs.linuxPackages_latest;

    # Extra configuration and additional settings
    networking = {
      hostName = "vermilion";
      firewall = {
        allowedTCPPorts = [];
        allowedUDPPorts = [41641];
        trustedInterfaces = ["tailscale0"];
      };
    };

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [];

    # Enabling swap
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 32 * 1024; # 16 GiB
        options = ["discard"];
      }
    ];

    # Enabling tailscale
    services.tailscale = {
      enable = true;

      # Disabling logging and telemetry
      extraDaemonFlags = ["--no-logs-no-support"];
    };

    # Used for backwards compatibility, please read the changelog before changing.
    system.stateVersion = "25.11";
  };
}
