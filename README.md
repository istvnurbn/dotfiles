# dotfiles

This repo contains the configuration to setup my Mac by using [Chezmoi](https://chezmoi.io), the dotfile manager.

## How to run

```shell
export GITHUB_USERNAME=istvnurbn
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
```
