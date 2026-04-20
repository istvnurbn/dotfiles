# Helper allowing direct editing of dotfiles without requiring a full configuration rebuild.
{
  flake.modules.homeManager.steve = {config, ...}: let
    dotsLink = path:
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/steve/dots/${path}";
  in {
    home.file.".abcde.conf".source = dotsLink "dot-abcde.conf";
    home.file.".gitconfig".source = dotsLink "dot-gitconfig";
    home.file.".zshrc".source = dotsLink "dot-zshrc";

    home.file.".config/alacritty/alacritty.toml".source = dotsLink "dot-config/alacritty/alacritty.toml";
    home.file.".config/atuin/config.toml".source = dotsLink "dot-config/atuin/config.toml";
    home.file.".config/dtop/config.yaml".source = dotsLink "dot-config/dtop/config.yaml";
    home.file.".config/ghostty/config".source = dotsLink "dot-config/ghostty/config";
    home.file.".config/mc/ini".source = dotsLink "dot-config/mc/ini";
    home.file.".local/share/mc/skins/catppuccin.ini".source = dotsLink "dot-local/share/mc/skins/catppuccin.ini";
    home.file.".config/zed/settings.json".source = dotsLink "dot-config/zed/settings.json";
  };
}
