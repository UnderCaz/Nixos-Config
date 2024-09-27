{
  description = "Systems Flake";

  outputs = 
  {
    self,
    nixpkgs-unstable,
    nix-systems
  }@inputs: 
  let
    eachSystem = nixpkgs-unstable.lib.genAttrs (import nix-systems);
  in{

  };

  inputs = {
    # Nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nix-systems
    nix-systems.url = "github:nix-systems/default";
    # Home-manager
#    home-manager.url = 
  };
}
