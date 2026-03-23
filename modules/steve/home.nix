# Some magic to get home-manager to play nice with flake modules.
{inputs, ...}: let
  flake.homeConfigurations.steve = inputs.home-manager.lib.homeManagerConfiguration {
    modules = [inputs.self.homeModules.steve];
  };

  flake.homeModules.steve.imports = [
    inputs.self.modules.homeManager.steve
  ];

  flake.modules.homeManager.steve = {pkgs, ...}: {
    home.username = "steve";

    home.homeDirectory =
      if pkgs.stdenv.hostPlatform.isDarwin
      then "/Users/steve"
      else "/home/steve";

    home.stateVersion = "25.11";

    programs.home-manager.enable = true;
  };
in {
  inherit flake;
}
