let
  flake.modules.nixos.virtualmonitor = {
    boot.kernelParams = ["video=HDMI-A-1"];

    hardware.display.edid.linuxhw."PG278Q_2014" = [
      "PG278Q"
      "2014"
    ];
    hardware.display.outputs."HDMI-A-1".edid = "PG278Q_2014";
    hardware.display.outputs."HDMI-A-1".mode = "e";
  };
in {
  inherit flake;
}
