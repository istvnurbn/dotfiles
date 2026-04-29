{
  flake.modules.nixos.vermilion = {modulesPath, ...}: {
    imports = [
      (modulesPath + "/installer/scan/not-detected.nix")
    ];

    boot.initrd.availableKernelModules = ["nvme" "xhci_pci" "ahci" "usb_storage" "usbhid" "sd_mod"];
    boot.kernelModules = ["kvm-amd"];
  };
}
