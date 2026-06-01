let
  flake.modules.nixos.virtualbox = {
    virtualisation.virtualbox.host.enable = true;
    virtualisation.virtualbox.host.enableExtensionPack = true;
    users.extraGroups.vboxusers.members = ["steve"];
  };
in {
  inherit flake;
}
