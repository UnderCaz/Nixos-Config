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
          # Host settings
          {
            networking.hostName = name;
            environment.systemPackages = with pkgs-unstable; [ vim git ];
          }
          # Host configuration.nix
          (./hosts + /${name} + /configuration.nix)
          # A hardware-configuration.nix that is generated every build
          ./hardware-configuration.nix
          # Modules 
          ./modules
        ];
     };
    in
    {
      Desktoppu = mkNixosConfiguration "Desktoppu" "nixpkgs-unstable";  
      Laptoppu = mkNixosConfiguration "Laptoppu" "nixpkgs-unstable";
      Javetoppu = mkNixosConfiguration "Javetoppu" "nixpkgs-unstable"; 
    };
   
    # nix run commands
    packages.${system} =
    {
      default = inputs.self.packages.${system}.update;
  
      pull = pkgs-unstable.writeShellApplication
      {
        name = "pull";
        runtimeInputs = with pkgs-unstable; [ git ];
        text = 
        ''
          ${./scripts/pull.sh}
        '';
      };
      build = pkgs-unstable.writeShellApplication
      {
        name = "build";
        text = 
        ''
          ${./scripts/build.sh};
        '';
      };
      update = pkgs-unstable.writeShellApplication
      {
        name = "update";
        text =
        ''
          ${./scripts/pull.sh}
          ${./scripts/build.sh}
        ''; 
      };
      setup = pkgs-unstable.writeShellApplication
      {
        name = "setup";
        runtimeInputs = with pkgs-unstable; [ git ];
        text = 
        ''
          ${./scripts/setup.sh}
          ${./scripts/build.sh}
        '';
      };
    };
    
    apps.${system} =
    {
      default = inputs.self.apps.${system}.update;
 
      setup =
      {
        type = "app";
        program = "${inputs.self.packages.${system}.setup}/bin/setup";  
      };

      pull = 
      {
        type = "app";
        program = "${inputs.self.packages.${system}.pull}/bin/pull"; 
      };
      build = 
      {
        type = "app";
        program = "${inputs.self.packages.${system}.build}/bin/build";  
      };
      update =
      {
        type = "app";
        program = "${inputs.self.packages.${system}.update}/bin/update";  
      };
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
