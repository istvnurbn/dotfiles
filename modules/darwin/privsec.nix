# Assorted privacy and security settings
let
  flake.modules.darwin.privsec = {
    system.defaults.screensaver = {
      # Ask for password when the screen saver unlocked or stopped
      askForPassword = true;

      # Grace period before the password is required to unlock or stop the screen saver
      askForPasswordDelay = 0;
    };

    system.defaults.loginwindow = {
      # Disable the ability to access the console by typing “>console” for a username at the login window
      DisableConsoleAccess = true;

      # Disable guest access
      GuestEnabled = false;
    };

    # Enable application firewall
    networking.applicationFirewall.enable = true;

    system.defaults.CustomSystemPreferences = {
      # Disable personalized advertisements and identifier tracking.
      "com.apple.AdLib" = {
        "allowIdentifierForAdvertising" = false;
        "allowApplePersonalizedAdvertising" = false;
        "forceLimitAdTracking" = true;
      };

      # Disable Microsoft Office telemetry
      "com.microsoft.office" = {"DiagnosticDataTypePreference" = "ZeroDiagnosticData";};

      # Software update
      "com.apple.SoftwareUpdate" = {
        # Check for automatic updates daily
        AutomaticCheckEnabled = true;
        ScheduleFrequency = 1;

        # Disable automatic installation of macOS updates
        AutomaticallyInstallMacOSUpdates = false;

        # Disable automatic app updates from the App Store
        AutomaticallyInstallAppUpdates = false;
      };

      # Disable online spell correction
      NSGlobalDomain = {
        WebAutomaticSpellingCorrectionEnabled = false;
      };
    };
  };
in {
  inherit flake;
}
