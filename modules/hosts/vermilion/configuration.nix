# Host config for my gaming PC
{inputs, ...}: {
  flake.modules.nixos.vermilion = {
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
      cachyos-kernel
      amdcpu
      amdgpu
      eightbitdo
      boot
      locale
      networking
      security
      plymouth
      plasma
      pipewire
      bluetooth
      devel
      browsers
      gui-core
      gaming
      gsr
      flatpak
      openrgb
      tailscale
      # virtualbox
      # coolercontrol
      # vm

      # User module
      # ../../steve
      steve
    ];

    # Setting the hostname
    networking.hostName = "vermilion";

    # Enabling swap
    swapDevices = [
      {
        device = "/var/lib/swapfile";
        size = 32 * 1024; # 32 GiB
        options = ["discard"];
      }
    ];

    # Used for backwards compatibility, please read the changelog before changing.
    system.stateVersion = "25.11";
  };
}
