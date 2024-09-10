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
      }; 
    };

    pkgs-unstable = import inputs.nixpkgs-unstable
    {
      inherit system;
      config = 
      {
        allowUnfree = true;
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
            environment.systemPackages = with pkgs-unstable; [ vim git ];
          }
    
          (./hosts + /${name} + /configuration.nix)
        ];
     };
    in
    {
      Desktoppu = mkNixosConfiguration "Desktoppu" "nixpkgs-unstable";  
      Laptoppu = mkNixosConfiguration "Laptoppu" "nixpkgs-unstable";
      #Javetoppu = mkNixosConfiguration "Javetoppu" "nixpkgs-unstable"; #setup build hardware config
    };
   
    # nix run commands
    packages.${system}.pull = pkgs-unstable.writeShellApplication
    {
      name = "pull";
      runtimeInputs = with pkgs-unstable; [ git ];
      text = 
      ''
        ${./scripts/pull.sh}
      '';
    };
  };

  inputs = 
  {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    # Flake utils
    utils.url = "github:numtide/flake-utils";
  };
}
