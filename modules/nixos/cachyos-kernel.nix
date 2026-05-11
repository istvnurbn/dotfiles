{inputs, ...}: let
  flake-file.inputs = {
    nix-cachyos-kernel.url = "github:xddxdd/nix-cachyos-kernel?rev=de4bf344b26f355b5d92071503f7a8fd18bc7f6b";
  };

  flake.modules.nixos.cachyos-kernel = {pkgs, ...}: {
    # Enabling CachyOS kernel overlay
    nixpkgs.overlays = [inputs.nix-cachyos-kernel.overlays.default];

    # Setting the kernel package
    boot.kernelPackages = pkgs.cachyosKernels.linuxPackages-cachyos-latest-zen4;

    # Binary cache for CachyOS kernel
    nix.settings.substituters = [
      "https://attic.xuyh0120.win/lantian"
      "https://cache.garnix.io"
    ];
    nix.settings.trusted-public-keys = [
      "lantian:EeAUQ+W+6r7EtwnmYjeVwx5kOGEBpjlBfPlzGlTNvHc="
      "cache.garnix.io:CTFPyKSLcx5RMJKfLo5EEPUObbA78b0YQ2DTCJXqr9g="
    ];
  };
in {
  inherit flake flake-file;
}
