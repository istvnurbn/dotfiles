let
  flake.modules.darwin.nix-settings = {
    # Do garbage collection to keep disk usage low
    nix.gc = {
      automatic = true;
      interval = [
        {
          Hour = 3;
          Minute = 15;
          Weekday = 7;
        }
      ];
      options = "--delete-older-than 7d";
    };
  };
in {
  inherit flake;
}
