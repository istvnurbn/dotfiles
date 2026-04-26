let
  flake.modules.nixos.vm = {pkgs, ...}: {
    programs.virt-manager.enable = true;
    users.groups.libvirtd.members = ["steve"];
    virtualisation.libvirtd = {
      enable = true;
      qemu.vhostUserPackages = with pkgs; [virtiofsd];
    };
    virtualisation.spiceUSBRedirection.enable = true;

    networking.firewall.trustedInterfaces = ["virbr0"];

    environment.systemPackages = with pkgs; [
      dnsmasq
    ];
  };
in {
  inherit flake;
}
