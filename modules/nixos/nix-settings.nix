let
  flake.modules.nixos.nix-settings = {
    # Do garbage collection to keep disk usage low
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };
  };
in {
  inherit flake;
}
