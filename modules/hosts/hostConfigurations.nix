# Host level configurations aka. bringing it all together
# Based on https://github.com/vic/vix
# and https://github.com/Doc-Steve/dendritic-design-with-flake-parts
{inputs, ...}: let
  inherit
    (inputs.self.lib.mkHost)
    # Supported OS types
    linux
    # linux-arm
    darwin
    # darwin-intel
    ;

  flake.nixosConfigurations = {
    # hostname = linux/linux-arm "hostname"
    parallax = linux "parallax";
    vermilion = linux "vermilion";
  };

  flake.darwinConfigurations = {
    # hostname = darwin/darwin-intel "hostname"
    hexley = darwin "hexley";
  };
in {
  inherit flake;
}
