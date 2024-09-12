{ inputs, config, pkgs, ... }:
{
   imports = 
   [
      inputs.home-manager.nixosModules.home-manager
   ];

   # User Configuration
   users.users = 
   {
      jave = 
      {
         isNormalUser = true;
         extraGroups = [ "wheel" "networkmanager" ];
      };
   };
   # Home Configuration
   home-manager =
   {
      extraSpecialArgs = { inherit inputs; };
      users = { jave = import ./home.nix; };
   };
}
