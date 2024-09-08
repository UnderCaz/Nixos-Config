{
  description = "Chal's Flake";
 
  outputs = { ... }@inputs: 
  let
    system = "x86_64-linux"; 

    pkgs-stable = import inputs.nixpkgs-stable
    {
      inherit system;
      config = 
      {
        allowUnfree = true;
       # allowUnfreePredicate = (_: true);
      }; 
    };

    pkgs-unstable = import inputs.nixpkgs-unstable
    {
      inherit system;
      config = 
      {
        allowUnfree = true;
       # allowUnfreePredicate = (_: true);
      }; 
    };
  in
  {
    nixosConfigurations = 
    let
      # Function that returns a NixosConfiguration set
      mkNixosConfiguration = name: nixpkgs: inputs.${nixpkgs}.lib.nixosSystem
      {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = 
        [
          {
            networking.hostName = name;
          }
  
          (./hosts + /${name} + /configuration.nix)
        ];
     };
    in
    {
      Desktoppu = mkNixosConfiguration "Desktoppu" "nixpkgs-unstable";  
      Laptoppu = mkNixosConfiguration "Laptoppu" "nixpkgs-unstable";
      Javetoppu = mkNixosConfiguration "Javetoppu" "nixpkgs-unstable";
    };
  };

  inputs = 
  {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };
}
