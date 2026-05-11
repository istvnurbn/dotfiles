let
  flake.modules.nixos.nas-acl = {
    # ACL rules for common folders
    systemd.tmpfiles.rules = [
      # Docker container data
      "d  /srv/docker                       2775  steve         homelab - -"
      "Z  /srv/docker                       2775  steve         homelab - -"
      "A  /srv/docker                       -     -             -       - user:steve:rwx"
      "A  /srv/docker                       -     -             -       - default:user:steve:rwx"
      "A  /srv/docker                       -     -             -       - group:homelab:rwx"
      "A  /srv/docker                       -     -             -       - default:group:homelab:rwx"
      "Z  /srv/docker/qbittorrent/postgres  2775  qui-postgres  homelab - -"
      "A  /srv/docker/qbittorrent/postgres  -     -             -       - user:qui-postgres:rwx"
      "A  /srv/docker/qbittorrent/postgres  -     -             -       - default:user:qui-postgres:rwx"

      # Shared files
      "Z  /srv/data 2775  steve homelab - -"
      "A  /srv/data -     -     -       - user:steve:rwx"
      "A  /srv/data -     -     -       - default:user:steve:rwx"
      "A  /srv/data -     -     -       - group:homelab:rwx"
      "A  /srv/data -     -     -       - default:group:homelab:rwx"

      "Z  /srv/public 2775  steve homelab - -"
      "A  /srv/public -     -     -       - user:steve:rwx"
      "A  /srv/public -     -     -       - default:user:steve:rwx"
      "A  /srv/public -     -     -       - group:homelab:rwx"
      "A  /srv/public -     -     -       - default:group:homelab:rwx"
    ];
  };
in {
  inherit flake;
}
