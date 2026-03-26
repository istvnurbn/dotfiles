# Yeah, that's me
{inputs, ...}: let
  flake.modules.darwin.steve.imports = [
    user
    home
    darwin
  ];

  flake.modules.nixos.steve.imports = [
    user
    home
    linux
  ];

  user = {pkgs, ...}: {
    users.users.steve = {
      description = "István Urbán";
      home =
        if pkgs.stdenv.hostPlatform.isDarwin
        then "/Users/steve"
        else "/home/steve";
      shell = pkgs.zsh;
    };

    home-manager.backupFileExtension = "backup";
  };

  home.home-manager.users.steve.imports = [
    inputs.self.homeModules.steve
  ];

  darwin = {
    system.primaryUser = "steve";

    system.defaults.dock.persistent-apps = [
      "/Applications/Firefox.app"
      "/Applications/Proton Mail.app"
      "/System/Applications/Mail.app"
      "/System/Applications/Messages.app"
      "/System/Applications/Calendar.app"
      "/System/Applications/Notes.app"
      "/System/Applications/Reminders.app"
      "/System/Applications/Photos.app"
      "/Applications/Ghostty.app"
    ];
  };

  linux = {
    users.users.steve = {
      isNormalUser = true;
      extraGroups = [
        "networkmanager"
        "wheel"
      ];
      hashedPassword = "$y$j9T$ae.Dmqz2N2YdPvY1xUvwu0$wdBYfrORJhqvPUPJpFP7oHsYrxBAwBec2hAKbc3KnM4";
    };
  };
in {
  inherit flake;
}
