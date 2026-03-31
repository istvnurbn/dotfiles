let
  flake.modules.nixos.docker = {pkgs, ...}: {
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

    # Lazydocker to monitor docker
    environment.systemPackages = with pkgs; [lazydocker];
  };
in {
  inherit flake;
}
