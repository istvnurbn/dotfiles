let
  flake.modules.nixos.nas-acl = {
    # ACL rules for common folders
    systemd.tmpfiles.rules = [
      "d  /srv/docker 2775  steve homelab - -"
      "Z  /srv/docker 2775  steve homelab - -"
      "a+ /srv/docker -     -     -       - user:steve:rwx"
      "a+ /srv/docker -     -     -       - default:user:steve:rwx"
      "a+ /srv/docker -     -     -       - group:homelab:rwx"
      "a+ /srv/docker -     -     -       - default:group:homelab:rwx"

      "Z  /srv/data 2775  steve homelab - -"
      "a+ /srv/data -     -     -       - user:steve:rwx"
      "a+ /srv/data -     -     -       - default:user:steve:rwx"
      "a+ /srv/data -     -     -       - group:homelab:rwx"
      "a+ /srv/data -     -     -       - default:group:homelab:rwx"

      "Z  /srv/public 2775  steve homelab - -"
      "a+ /srv/public -     -     -       - user:steve:rwx"
      "a+ /srv/public -     -     -       - default:user:steve:rwx"
      "a+ /srv/public -     -     -       - group:homelab:rwx"
      "a+ /srv/public -     -     -       - default:group:homelab:rwx"
    ];
  };
in {
  inherit flake;
}
