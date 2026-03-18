# GUI applications installed from Homebrew Cask instead of nixpkgs
# [TODO] Move these to nixpkgs or nix-casks/brew-nix where feasible
let
  flake.modules.darwin.casks = {
    homebrew.casks = [
      "zed"
      "ghostty"
      "git-credential-manager"
      "firefox"
      "brave-browser"
      "tor-browser"
      "proton-pass"
      "proton-mail"
      "proton-drive"
      "iina"
      "spotify"
      "calibre"
      "localsend"
      "thaw"
      "tailscale-app"
      "musicbrainz-picard"
      "rustdesk"
      "utm"
    ];
  };
in {
  inherit flake;
}
