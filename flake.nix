{
  description = "Chal's Flake";

  inputs = 
  {
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
  };

  outputs = 
  { 
    nixpkgs-stable,
    nixpkgs-unstable, 
    ... 
  }@inputs: 
  let
    system = "x86_64-linx";
  in
  {
    nixosConfigurations = 
    {
      Desktoppu = nixpkgs-unstable.lib.nixosSystem 
      {
        modules = 
        [
          ./hosts/Desktoppu/configuration.nix
        ];
      };

      Laptoppu = nixpkgs-unstable.lib.nixosSystem
      {
        modules = 
        [
          ./hosts/Laptoppu/configuration.nix
        ];
      };

      Javetopppu = nixpkgs-unstable.lib.nixosSystem
      {
        modules = 
        [
          ./hosts/Javetoppu/configuration.nix
        ];
      };
    };
  };
}
