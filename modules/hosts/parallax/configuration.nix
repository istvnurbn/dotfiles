# Host config for my NAS/homelab
{inputs, ...}: {
  flake.modules.nixos.parallax = {pkgs, ...}: {
    imports = with inputs.self.modules.nixos; [
      # Common modules
      # ../../common
      nix-settings
      home
      shell

      # NixOS specific modules
      # ../../nixos
      core
      security
      docker
      nas-samba
      nas-users
      nas-acl

      # User module
      # ../../steve
      steve
    ];

    # Extra configuration and additional settings
    networking = {
      hostName = "parallax";
      hostId = "d0519aef"; # Needed for ZFS head -c4 /dev/urandom | od -A none -t x4
      firewall = {
        allowedTCPPorts = [80 443 6881 32400];
        allowedUDPPorts = [41641];
        trustedInterfaces = ["tailscale0"];
      };
    };

    # List packages installed in system profile.
    environment.systemPackages = with pkgs; [zfs];

    # Loading ZFS kernel module
    boot.supportedFilesystems = ["zfs"];

    # Use the pool set up in disko-config
    boot.zfs = {
      forceImportAll = true;
      extraPools = ["tank"];
    };

    # Enabling tailscale
    services.tailscale = {
      enable = true;

      # Enable routing features
      useRoutingFeatures = "both";

      # Disabling logging and telemetry
      extraDaemonFlags = ["--no-logs-no-support"];
    };

    # Used for backwards compatibility, please read the changelog before changing.
    system.stateVersion = "25.11";
  };
}
