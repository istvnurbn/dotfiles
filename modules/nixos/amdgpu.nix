{inputs, ...}: let
  flake-file.inputs = {
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel/release";
  };

  flake.modules.nixos.amdgpu = {pkgs, ...}: {
    # CachyOS kernel
    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.default];

    # Binary cache for CachyOS kernel
    nix.settings.substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.garnix.io"
    ];
    nix.settings.trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];

    # Kernel settings for amdgpu
    boot = {
      kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;
      kernelModules = [
        "amdgpu"
        "ntsync"
      ];
    };

    # Enable hardware accelerated graphics drivers
    hardware = {
      graphics = {
        enable = true;
        enable32Bit = true; # also install 32-bit drivers for 32-bit applications
      };
      amdgpu = {
        initrd.enable = true; # Can fix lower resolution in boot screen during initramfs phase
        overdrive.enable = true; # Overclocking
        opencl.enable = true; # OpenCL support using ROCM runtime library
      };
    };

    # Enable LACT, a tool for monitoring, configuring and overclocking GPUs
    services.lact.enable = true;
  };
in {
  inherit flake flake-file;
}
