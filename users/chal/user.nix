{ inputs, config, pkgs, ... }:
{
   imports = 
   [
      inputs.home-manager.nixosModules.home-manager
   ];

   # User Configuration
   users.users = 
   {
      chal = 
      {
         isNormalUser = true;
         extraGroups = [ "wheel" "networkmanager" ];
      };
   };
   # Home Configuration
   home-manager =
   {
      extraSpecialArgs = { inherit inputs; };
      users = { chal = import ./home.nix; };
   };
}
