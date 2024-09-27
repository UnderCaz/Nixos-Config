{
  description = "Systems Flake";

  outputs = { ... }@inputs: 
  let
    eachSystem = inputs.nixpkgs-unstable.lib.genAttrs (import inputs.nix-systems);
  in
  {
    # NixosConfiguratinos
    nixosConfiguration = # A function can be made to automate this
    {
      system = inputs.lib.nixosSystem 
      {
	system = "x86_64-linux"; # Should be able to replace this
	modules = 
	[
	  ./hosts/Desktoppu # Will import the default.nix file
	  ./hosts/hardware-configuration.nix
	];
	specialArgs = 
	{
	  inherit inputs;
	};
      };
    };
  }; # End of outputs

  inputs = {
    # Nixpkgs
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    # Nix-systems
    nix-systems.url = "github:nix-systems/default";
    # Home-manager
    #home-manager.url = "github:nix-community/home-manager";
    #home-manager.inputs.follows = "nixpkgs-unstable";
  }; # End of inputs
}
