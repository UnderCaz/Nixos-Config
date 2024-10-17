{
  description = "Systems Flake";

  outputs = { ... }@inputs: 
  let
    # Config  
    eachSystem = inputs.nixpkgs-unstable.lib.genAttrs (import inputs.nix-systems);
  in
  {
    # Host configuration
    nixosConfiguration = 
    { 
      Desktoppu = lib.nixosSystem 
      {
	system = "x86_64-linux"; # Replace this with nixSystems
	modules = 
	[
	  ./hosts/Desktoppu
	  ./hosts/hardware-configuration.nix
	  ./users/chal
	]; 
      }; 
    };
  }; 

  inputs = {
    # Nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nix-systems
    nix-systems.url = "github:nix-systems/default";
    # Home-manager
    home-manager = 
    {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs-unstable";
    };
  }; 
}
