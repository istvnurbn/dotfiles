# A set of command line tools that'll make life better in the terminal
let
  flake.modules.nixos = {inherit shell;};
  flake.modules.darwin = {inherit shell;};

  shell = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      coreutils
      nano
      mc
      gnutar # macOS tar fails me sometimes
      openssh
      just
      atuin
      nixd
      alejandra
      nix-output-monitor
      nvd
      just-lsp
      git
      git-absorb
      zoxide
      fzf
      rsync
      curl
      wget
      pv
      recode
      mmv
      gawk
      bat
      tree
      btop
      fastfetch
      msedit # just for the fun of it
    ];

    # Configure zsh as an interactive shell
    programs.zsh.enable = true;
  };
in {
  inherit flake;
}
