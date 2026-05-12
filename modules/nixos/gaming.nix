# [TODO] Switch to different-name/steam-config-nix
# [TODO] Break out to individual pieces
{inputs, ...}: let
  flake-file.inputs = {
    scopebuddy.url = "github:HikariKnight/ScopeBuddy";
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

    environment.systemPackages = with pkgs; [
      heroic
      inputs.scopebuddy.packages.${pkgs.stdenv.hostPlatform.system}.default
      gamescope
      wineWow64Packages.wayland
      protontricks
      protonup-rs
      vulkan-tools
      gamemode
      mangohud
    ];
  };
in {
  inherit flake flake-file;
}
