# Host config for my MacBook Pro
{inputs, ...}: {
  flake.modules.darwin.hexley = {
    # Collecting all the features we want to be available on the given host
    imports = with inputs.self.modules.darwin; [
      # Common modules
      # ../../common
      nix-settings
      home
      shell
      media
      fonts

      # darwin specific modules
      # ../../darwin
      nix-darwin
      nix-homebrew
      brews
      casks
      masapps
      system
      privsec
      dock
      finder

      # User module
      # ../../steve
      steve
    ];

    # Extra configuration and additional settings
    networking = {
      computerName = "Hexley";
      hostName = "hexley";
      localHostName = "hexley";
    };

    security.pam.services.sudo_local = {
      # Use TouchID for sudo
      touchIdAuth = true;

      # Fixes Touch ID for sudo not working inside tmux and screen
      reattach = true;
    };

    system = {
      # Disable the startup chime
      startup.chime = false;

      # Used for backwards compatibility, please read the changelog before changing.
      # $ darwin-rebuild changelog
      stateVersion = 6;
    };
  };
}
