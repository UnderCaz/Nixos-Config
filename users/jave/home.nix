{ config, pkgs, ... }:

{
   home.username = "jave";
   home.homeDirectory = "/home/jave";
   
   # Packages
   home.packages =  with pkgs;
   [
      firefox
      chromium 
   ];

   # Dotfiles
   home.file = {
   };

   # Env Variables
   home.sessionVariables = {
    # EDITOR = "emacs";
   };

   programs.home-manager.enable = true;

   home.stateVersion = "24.05"; 
}
