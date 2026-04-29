# [TODO] Break out to individual parts
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
      extraCompatPackages = [
        pkgs.proton-ge-bin
      ];
    };

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
      wineWow64Packages.stable
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
