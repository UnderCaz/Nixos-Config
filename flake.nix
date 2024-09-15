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
         mkNixosConfiguration = name: nixpkgs: extramodules: inputs.${nixpkgs}.lib.nixosSystem
         {
            inherit system;
            specialArgs = { inherit inputs; };
            modules = 
            [
               # Host settings
               {
                  networking.hostName = name;

                  nix.settings.experimental-features = [ "nix-command" "flakes" ];
                  nixpkgs.config.allowUnfree = true;
                  environment.systemPackages = with pkgs-unstable; [ git home-manager ];
               }

               # Host configuration.nix
               (./hosts + /${name} + /configuration.nix)

               # A hardware-configuration.nix that is generated every build
               ./hardware-configuration.nix

               # Modules 
               ./modules
            ] ++ extramodules;
         };
      in
      {
         # System Configurations
         Desktoppu = mkNixosConfiguration "Desktoppu" "nixpkgs-unstable" 
         [
            ./users/chal/user.nix
            {
               amdgpu.enable = true;
               gnome.enable = true;
               tailscale.enable = true;
               printing.enable = true;
               steam.enable = true;
               protonge.enable = true;
               gamemode.enable = true;
               kdeconnect.enable = true; 
            }
         ];  
         Laptoppu = mkNixosConfiguration "Laptoppu" "nixpkgs-unstable"
         [
            ./users/chal/user.nix
            {
              gnome.enable = true; 
              tailscale.enable = true;
              printing.enable = true;
              kdeconnect.enable = true;
            }
         ];
         Javetoppu = mkNixosConfiguration "Javetoppu" "nixpkgs-unstable" 
         [
            ./users/jave/user.nix
            {
               nvidiagpu.enable = true;
               gnome.enable = true;
               steam.enable = true;
               protonge.enable = true;
               gamemode.enable = true;
               kdeconnect.enable = true;
            }               
         ];
      };

      # nix run commands
      packages.${system} =
      {
         default = inputs.self.packages.${system}.install;

         pull = pkgs-unstable.writeShellApplication
         {
         name = "pull";
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
         install = pkgs-unstable.writeShellApplication
         {
            name = "install";
            text =
            ''
               ${./scripts/install.sh}
               ${./scripts/build.sh}
            ''; 
         };
      };

      apps.${system} =
      {
         default = inputs.self.apps.${system}.install;

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
         install =
         {
            type = "app";
            program = "${inputs.self.packages.${system}.install}/bin/install";  
         };
      };
   };

# INPUTS
   inputs = 
   {
      nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-24.05";
      nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

      # Flake utils
      utils.url = "github:numtide/flake-utils"; # primarily going to use nix-systems
      # Nix-systems
      #nixsystems.url = "github:nix-systems/nix-systems";

      # Home-Manager
      home-manager = 
      {
         url = "github:nix-community/home-manager";
         inputs.nixpkgs.follows = "nixpkgs-unstable";
      };

      # Nixvim
      nixvim =
      {
         url = "github:nix-community/nixvim";
         inputs.nixpkgs.follows = "nixpkgs-unstable";
      };
   };
}
