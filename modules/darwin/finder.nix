# Finder settings
let
  flake.modules.darwin.finder = {
    system.defaults.finder = {
      # Always show file extensions
      AppleShowAllExtensions = true;

      # Change the default search scope to current folder
      FXDefaultSearchScope = "SCcf";

      # List view as the default Finder view
      FXPreferredViewStyle = "Nlsv";

      # Remove items in the trash after 30 days
      FXRemoveOldTrashItems = true;

      # Home folder as the default folder shown in Finder windows
      NewWindowTarget = "Home";

      # Allow quitting the Finder
      QuitMenuItem = true;

      # Show connected servers on desktop
      ShowMountedServersOnDesktop = true;

      # Show path breadcrumbs in Finder windows
      ShowPathbar = true;

      # Resize columns to fit filenames
      _FXEnableColumnAutoSizing = true;

      # Keep folders on top when sorting by name
      _FXSortFoldersFirst = true;

      # Keep folders on top when sorting by name on the desktop
      _FXSortFoldersFirstOnDesktop = true;
    };
  };
in {
  inherit flake;
}
