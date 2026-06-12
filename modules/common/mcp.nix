{inputs, ...}: let
  flake-file.inputs = {
    nix-agent.url = "github:JEFF7712/nix-agent";
  };

  flake.modules.nixos = {inherit mcp;};
  flake.modules.darwin = {inherit mcp;};

  mcp = {pkgs, ...}: {
    imports = [inputs.nix-agent.nixosModules.default];

    environment.systemPackages = with pkgs; [mcp-nixos];

    programs.nix-agent.enable = true;
  };
in {
  inherit flake flake-file;
}
