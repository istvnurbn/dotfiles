# [TODO] Switch to different-name/steam-config-nix
# [TODO] Break out to individual pieces
{inputs, ...}: let
  flake-file.inputs = {
    scopebuddy.url = "github:HikariKnight/ScopeBuddy";
    umu = {
      url = "github:Open-Wine-Components/umu-launcher?dir=packaging/nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    proton-cachyos.url = "github:powerofthe69/proton-cachyos-nix";
  };

  flake.modules.nixos.gaming = {pkgs, ...}: {
    programs.steam = {
      enable = true;
      protontricks.enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
      extest.enable = true;
      extraCompatPackages = with pkgs; [
        proton-ge-bin
        proton-cachyos
      ];
      extraPackages = with pkgs; [
        hidapi
      ];
    };

    # Enable udev rules for Steam hardware
    hardware.steam-hardware.enable = true;

    services.sunshine = {
      enable = true;
      capSysAdmin = true;
      openFirewall = true;
    };

    environment.sessionVariables = {
      # Proton settings
      PROTON_ENABLE_HDR = "1";
      PROTON_USE_NTSYNC = "1";
      PROTON_FSR4_UPGRADE = "1";
      PROTON_XESS_UPGRADE = "1";
    };

    nixpkgs.overlays = [
      inputs.umu.overlays.default
      inputs.proton-cachyos.overlays.default
    ];

    environment.systemPackages = with pkgs; [
      gamemode
      mangohud
      gamescope
      inputs.scopebuddy.packages.${pkgs.stdenv.hostPlatform.system}.default
      wineWow64Packages.wayland
      protontricks
      protonup-qt
      vulkan-tools
      faugus-launcher
    ];
  };
in {
  inherit flake flake-file;
}
