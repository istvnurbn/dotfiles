let
  flake.modules.nixos.nas-users = {
    # System users for docker services
    users.users = {
      # User for filebrowser docker service
      filebrowser = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 501;
        group = "homelab";
      };

      # User for qbittorrent docker service
      qbittorrent = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 502;
        group = "homelab";
      };

      # User for prowlarr docker service
      prowlarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 503;
        group = "homelab";
      };

      # User for radarr docker service
      radarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 504;
        group = "homelab";
      };

      # User for sonarr docker service
      sonarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 505;
        group = "homelab";
      };

      # User for bazarr docker service
      bazarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 506;
        group = "homelab";
      };

      # User for plex docker service
      plex = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 507;
        group = "homelab";
      };

      # User for metube docker service
      metube = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 508;
        group = "homelab";
      };
    };
  };
in {
  inherit flake;
}
