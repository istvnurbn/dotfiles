# Assorted system settings
let
  flake.modules.darwin.system = {
    system.defaults.NSGlobalDomain = {
      # Use 24-hour time
      AppleICUForce24HourTime = true;

      # Automatically switch icon and widget style
      AppleIconAppearanceTheme = "RegularAutomatic";

      # Automatically switch between light and dark mode
      AppleInterfaceStyleSwitchesAutomatically = true;

      # Use the metric system
      AppleMeasurementUnits = "Centimeters";
      AppleMetricUnits = 1;
      AppleTemperatureUnit = "Celsius";

      # Jump to the spot that’s clicked on the scroll bar
      AppleScrollerPagingBehavior = true;

      # Show the scrollbars when scrolling
      AppleShowScrollBars = "WhenScrolling";

      # Disable automatic spelling correction
      NSAutomaticSpellingCorrectionEnabled = false;

      # Do not animate opening and closing of windows and popovers
      NSAutomaticWindowAnimationsEnabled = false;

      # Do not save new documents to iCloud by default
      NSDocumentSaveNewDocumentsToCloud = false;

      # Use expanded save panel by default
      NSNavPanelExpandedStateForSaveMode = true;
      NSNavPanelExpandedStateForSaveMode2 = true;

      # Enable moving window by holding anywhere on it like on Linux
      NSWindowShouldDragOnGesture = true;

      # Use the expanded print panel by default
      PMPrintingExpandedStateForPrint = true;
      PMPrintingExpandedStateForPrint2 = true;

      # Sets the beep/alert volume level to 50%
      "com.apple.sound.beep.volume" = 0.6065307;
    };

    system.defaults.trackpad = {
      # Enable tap to click
      Clicking = true;

      # Disable tap to drag
      Dragging = false;
    };

    system.defaults.ActivityMonitor = {
      # Change the icon in the Dock to CPU Usage
      IconType = 5;

      # Sort the main activity page based on descending CPU usage
      SortColumn = "CPUUsage";
      SortDirection = 0;
    };

    system.defaults.WindowManager = {
      # Clicking your wallpaper will move all windows out of the way to allow access to your desktop items and widgets
      EnableStandardClickToShowDesktop = false;

      # Hide widgets in Stage Manager
      StageManagerHideWidgets = true;

      # Hide widgets on desktop
      StandardHideWidgets = true;
    };

    system.defaults.screencapture = {
      # Disable drop shadow around screenshots
      disable-shadow = true;

      # Save screenshots to
      location = "~/Pictures/Screenshots";
    };

    # Settings not yet available through nix-darwin
    system.defaults.CustomSystemPreferences = {
      # Close windows when quitting an app
      NSGlobalDomain = {
        NSQuitAlwaysKeepsWindows = false;
      };

      # Do not write AppleDouble files on USB drives and network shares
      "com.apple.desktopservices" = {
        DSDontWriteNetworkStores = true;
        DSDontWriteUSBStores = true;
      };

      # Quit printing app once finished
      "com.apple.print.PrintingPrefs" = {
        "Quit When Finished" = true;
      };

      # Mail
      "com.apple.mail" = {
        # Show attachement at the end of mails
        DisableInlineAttachmentViewing = true;

        # Copy only mail addresses to clipboard
        AddressesIncludeNameOnPasteboard = false;

        # Disable animations
        DisableReplyAnimations = true;
        DisableSendAnimations = true;
      };

      # TextEdit
      "com.apple.TextEdit" = {
        # Start with an empty file.
        NSShowAppCentricOpenPanelInsteadOfUntitledFile = false;
        # Plain text editing.
        RichText = 0;
        PlainTextEncoding = 4;
        PlainTextEncodingForWrite = 4;
      };

      # Disk Utility
      "com.apple.DiskUtility" = {
        DUDebugMenuEnabled = true;
        advanced-image-options = true;
      };

      # Do not offer importing from external cameras
      "com.apple.ImageCapture" = {
        disableHotPlug = true;
      };

      # Do not offer to use new disks for backup target
      "com.apple.TimeMachine" = {
        DoNotOfferNewDisksForBackup = true;
      };
    };
  };
in {
  inherit flake;
}
