# The bare minimum for a dendritic setup
{inputs, ...}: {
  imports = [
    inputs.flake-file.flakeModules.dendritic
  ];

  flake-file = {
    description = "istvnurbn's Nix Environment";
  };
}
