let
  flake.modules.nixos.security = {
    # Extra rules for sudo
    security.sudo.extraRules = [
      {
        users = ["steve"];
        commands = [
          {
            command = "ALL";
            options = ["SETENV" "NOPASSWD"];
          }
        ];
      }
    ];

    # Enable the firewall
    networking.firewall.enable = true;

    # Enable the OpenSSH daemon
    services.openssh = {
      enable = true;
      openFirewall = true;
    };
  };
in {
  inherit flake;
}
