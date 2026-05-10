let
  flake.modules.nixos.nas-users = {
    # System users for docker services
    users.users = {
      # User for traefik docker service
      traefik = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 501;
        group = "homelab";
      };

      # User for homepage docker service
      homepage = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 502;
        group = "homelab";
      };

      # User for filebrowser docker service
      filebrowser = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 503;
        group = "homelab";
      };

      # User for prowlarr docker service
      prowlarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 504;
        group = "homelab";
      };

      # User for radarr docker service
      radarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 505;
        group = "homelab";
      };

      # User for sonarr docker service
      sonarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 506;
        group = "homelab";
      };

      # User for bazarr docker service
      bazarr = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 507;
        group = "homelab";
      };

      # User for qbittorrent docker service
      qbittorrent = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 508;
        group = "homelab";
      };

      # User for qui-postgres docker service
      qui-postgres = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 509;
        group = "homelab";
      };

      # User for qui docker service
      qui = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 510;
        group = "homelab";
      };

      # User for plex docker service
      plex = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 511;
        group = "homelab";
      };

      # User for tautulli docker service
      tautulli = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 512;
        group = "homelab";
      };

      # Usxer for metube docker service
      metube = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 513;
        group = "homelab";
      };

      # User for stirlingpdf docker service
      stirlingpdf = {
        isSystemUser = true;
        createHome = false;
        shell = "/bin/false";
        uid = 514;
        group = "homelab";
      };
    };
  };
in {
  inherit flake;
}
