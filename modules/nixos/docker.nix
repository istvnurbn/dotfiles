let
  flake.modules.nixos.docker = {
    # Enable Docker
    virtualisation.docker = {
      enable = true;
      autoPrune = {
        enable = true;
        dates = "weekly";
      };
    };

    # Adding my user to the Docker group
    users.extraGroups.docker.members = ["steve"];
  };
in {
  inherit flake;
}
