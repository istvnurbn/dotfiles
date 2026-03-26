# Command line tools for media manipulation
let
  flake.modules.nixos = {inherit media;};
  flake.modules.darwin = {inherit media;};

  media = {pkgs, ...}: {
    environment.systemPackages = with pkgs; [
      exiftool
      imagemagick
      cddiscid
      libcdio-paranoia
      abcde
      lame
      flac
      id3v2
      recode
      ffmpeg-full
      hugo
    ];
  };
in {
  inherit flake;
}
