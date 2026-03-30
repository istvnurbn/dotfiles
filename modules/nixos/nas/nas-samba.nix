let
  flake.modules.nixos.nas-samba = {pkgs, ...}: {
    # Setting up the samba service and shares on parallax
    services = {
      samba = {
        enable = true;
        package = pkgs.samba4Full;
        openFirewall = true;

        settings = {
          global = {
            # "server smb encrypt" = "required";
            "server min protocol" = "SMB3_00";
            "use sendfile" = "yes";
            "workgroup" = "WORKGROUP";
            "security" = "user";
            "logging" = "systemd";
            "map to guest" = "bad user";
            "guest account" = "tango";

            # Disable printer sharing
            "load printers" = "no";
            "printing" = "bsd";
            "printcap name" = "/dev/null";
            "disable spoolss" = "yes";
            "show add printer wizard" = "no";

            # Extra options for Apple devices
            "vfs objects" = "catia fruit streams_xattr";
            "fruit:nfs_aces" = "no";
            "fruit:zero_file_id" = "yes";
            "fruit:metadata" = "stream";
            "fruit:encoding" = "native";
            "fruit:copyfile" = "yes";
            "fruit:model" = "MacSamba";
          };

          media = {
            "path" = "/srv/data";
            "comment" = "Media files";
            "writable" = "yes";
            "browseable" = "yes";

            "hide dot files" = "yes";
            "hide special files" = "yes";
            "follow symlinks" = "yes";
            "wide links" = "yes";
            "unix extensions" = "no";

            "create mask" = "0664";
            "force create mode" = "0664";
            "directory mask" = "2775";
            "force directory mode" = "2775";

            # Extra options for Apple devices
            "veto files" = "/._*/.DS_Store/";
            "delete veto files" = "yes";
            "fruit:time machine" = "no";
          };

          public = {
            "path" = "/srv/public";
            "comment" = "Public files";
            "public" = "yes";
            "read only" = "no";
            "guest only" = "yes";
            "writable" = "yes";
            "browseable" = "yes";

            "hide dot files" = "yes";
            "hide special files" = "yes";
            "follow symlinks" = "yes";
            "wide links" = "yes";
            "unix extensions" = "no";

            "force user" = "tango";
            "force group" = "homelab";
            "create mask" = "0664";
            "force create mode" = "0664";
            "directory mask" = "2775";
            "force directory mode" = "2775";

            # Extra options for Apple devices
            "veto files" = "/._*/.DS_Store/";
            "delete veto files" = "yes";
            "fruit:time machine" = "no";
          };
        };
      };

      samba-wsdd = {
        enable = true;
        openFirewall = true;
      };

      avahi = {
        enable = true;
        publish.enable = true;
        publish.userServices = true;
        openFirewall = true;
      };
    };

    # Group that can manipulate files on the NAS
    users.groups.homelab = {
      gid = 1337;
      members = ["steve"];
    };

    # Samba guest user
    # "Calling yourself Tango in the land of samba"
    # - Non ci sono due senza quattro (1984)
    users.users.tango = {
      isSystemUser = true;
      createHome = false;
      shell = "/bin/false";
      uid = 500;
      group = "homelab";
    };
  };
in {
  inherit flake;
}
