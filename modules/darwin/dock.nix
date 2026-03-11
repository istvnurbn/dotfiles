# Dock settings
let
  flake.modules.darwin.dock = {
    system.defaults.dock = {
      # Enable spring loading for all Dock items
      enable-spring-load-actions-on-all-items = true;

      # Display the appswitcher on all displays
      appswitcher-all-displays = true;

      # Automatically hide and show the dock
      autohide = true;

      # Sets the speed of the autohide delay
      autohide-delay = 0.0;

      # Sets the speed of the animation when hiding/showing the Dock
      autohide-time-modifier = 0.0;

      # Sets the speed of the Mission Control animations
      expose-animation-duration = 0.1;

      # Animate opening applications from the Dock
      launchanim = false;

      # Set the minimize/maximize window effect
      mineffect = "genie";

      # Minimize windows into their application icon
      minimize-to-application = true;

      # Do not automatically rearrange spaces
      mru-spaces = false;

      # Show indicator lights for open applications
      show-process-indicators = true;

      # Do not show recent applications
      show-recents = false;

      # Make icons of hidden applications tranclucent
      showhidden = true;

      # Hot corner action for bottom right corner
      wvous-br-corner = 1;
    };
  };
in {
  inherit flake;
}
