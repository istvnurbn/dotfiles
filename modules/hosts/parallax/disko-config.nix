{inputs, ...}: {
  flake.modules.nixos.parallax = {
    imports = [
      inputs.disko.nixosModules.disko
    ];

    disko.devices = {
      # Boot drive
      disk = {
        main = {
          type = "disk";
          device = "/dev/nvme0n1";
          content = {
            type = "gpt";
            partitions = {
              ESP = {
                size = "1G";
                type = "EF00";
                content = {
                  type = "filesystem";
                  format = "vfat";
                  mountpoint = "/boot";
                  mountOptions = ["umask=0077"];
                };
              };
              root = {
                size = "100%";
                content = {
                  type = "filesystem";
                  format = "ext4";
                  mountpoint = "/";
                };
              };
            };
          };
        };

        # Data drive
        storage = {
          type = "disk";
          device = "/dev/sda";
          content = {
            type = "gpt";
            partitions = {
              zfs = {
                size = "100%";
                content = {
                  type = "zfs";
                  pool = "tank";
                };
              };
            };
          };
        };
      };

      # Setting up the pool
      zpool = {
        tank = {
          type = "zpool";
          # I use a single SSD, no parity here
          mode = "";

          options = {
            ashift = "12";
            autotrim = "on";
          };

          rootFsOptions = {
            # Do not mount the "main" volume, only the datasets
            mountpoint = "none";
            acltype = "posixacl";
            atime = "off";
            compression = "zstd";
            xattr = "sa";
            logbias = "throughput";
          };

          datasets = {
            data = {
              type = "zfs_fs";
              mountpoint = "/srv/data";
            };

            public = {
              type = "zfs_fs";
              mountpoint = "/srv/public";
            };
          };
        };
      };
    };
  };
}
