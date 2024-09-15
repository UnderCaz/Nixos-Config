{ config, pkgs, ... }:

{
   imports = 
   [
      ./git.nix
      ./gnomeExtensions.nix
      ./theme.nix
   ];

   home.username = "chal";
   home.homeDirectory = "/home/chal";

   # Packages
   home.packages =  with pkgs;
   [
      vim 
      firefox
   ];

   # Dotfiles
   home.file = {
   };

   # Env Variables
   home.sessionVariables = {
   };

   programs.home-manager.enable = true;

   home.stateVersion = "24.05"; 
}
