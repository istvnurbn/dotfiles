_default:
    @just --list --unsorted

# Update flake inputs to their latest revisions
update:
    nix flake update --commit-lock-file --flake ~/dotfiles

## macOS

# Build the nix-darwin system configuration without switching to it
[macos]
build *args:
    sudo darwin-rebuild build --flake ~/dotfiles {{ args }} |& nom
    nvd diff /run/current-system ./result

# Build the nix-darwin configuration and switch to it
[macos]
switch *args:
    sudo darwin-rebuild switch --flake ~/dotfiles {{ args }} |& nom

# Backup iMessage messages
[macos]
imessage-backup:
    ../scripts/imessage_backup.sh

## NixOs

# Build the NixOS configuration without switching to it
[linux]
build *args:
    sudo nixos-rebuild build --flake ~/dotfiles {{ args }} |& nom
    nvd diff /run/current-system ./result

# Build the NixOS configuration and switch to it
[linux]
switch *args:
    sudo nixos-rebuild switch --flake ~/dotfiles {{ args }} |& nom

## Common

# Generate a new flake.nix file
write:
    nix run ~/dotfiles#write-flake

# Validate the flake.nix file
check:
    nix flake check ~/dotfiles

# Show the nix profile history
history:
    nix profile history --profile /nix/var/nix/profiles/system

# Perform a manual clean (garbage collect and wipe-history)
clean:
    sudo -H nix-env --profile /nix/var/nix/profiles/system --delete-generations old
    sudo -H nix-collect-garbage --delete-older-than 3d
