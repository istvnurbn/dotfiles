# [TODO] Break out to individual parts
{inputs, ...}: let
  flake-file.inputs = {
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel?rev=a26503528b4a4ab7310c6167da549f8fbee91f30";
    scopebuddy.url = "github:HikariKnight/ScopeBuddy";
  };

  flake.modules.nixos.gaming = {pkgs, ...}: {
    # CachyOS kernelexit
    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.default];

    boot = {
      kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
      kernelModules = ["amdgpu" "ntsync"];
      initrd.kernelModules = ["amdgpu"];
    };

    # hardware.graphics.enable32Bit = true; # For 32 bit applications
    # hardware.graphics.extraPackages = with pkgs; [
    #   amdvlk
    # ];
    # hardware.graphics.extraPackages32 = with pkgs; [
    #   driversi686Linux.amdvlk
    # ];

    services.lact.enable = true;
    systemd.packages = with pkgs; [lact];
    systemd.services.lactd.wantedBy = ["multi-user.target"];
    hardware.amdgpu.overdrive.enable = true;

    # Binary cache
    nix.settings.substituters = ["https://attic.xuyh0120.win/lantian"];
    nix.settings.trusted-public-keys = ["lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="];

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
      lact
    ];
  };
in {
  inherit flake flake-file;
}
