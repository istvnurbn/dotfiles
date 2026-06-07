let
  flake.modules.nixos.nix-settings = {
    # Do garbage collection to keep disk usage low
    nix.gc = {
      automatic = true;
      dates = "weekly";
      options = "--delete-older-than 7d";
    };

    programs.nix-ld.enable = true;
    #programs.nix-ld.libraries = with pkgs; [
    # Add any missing dynamic libraries for unpackaged programs
    # here, NOT in environment.systemPackages
    #];
  };
in {
  inherit flake;
}
