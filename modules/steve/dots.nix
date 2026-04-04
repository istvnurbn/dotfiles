# Helper allowing direct editing of dotfiles without requiring a full configuration rebuild.
{
  flake.modules.homeManager.steve = {config, ...}: let
    dotsLink = path:
      config.lib.file.mkOutOfStoreSymlink "${config.home.homeDirectory}/dotfiles/modules/steve/dots/${path}";
  in {
    home.file.".zshrc".source = dotsLink "dot-zshrc";
    home.file.".gitconfig".source = dotsLink "dot-gitconfig";
    home.file.".abcde".source = dotsLink "dot-abcde";

    home.file.".config/ghostty".source = dotsLink "dot-config/ghostty";
    home.file.".config/zed".source = dotsLink "dot-config/zed";
    home.file.".config/atuin".source = dotsLink "dot-config/atuin";
    home.file.".config/mc/ini".source = dotsLink "dot-config/mc/ini";
    home.file.".local/share/mc/skins/catppuccin.ini".source = dotsLink "dot-local/share/mc/skins/catppuccin.ini";
  };
}
