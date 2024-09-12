{ config, lib, pkgs, ... }:
{
   options =
   {
      gnome.enable = lib.mkEnableOption "enables gnome";
   };

   config = lib.mkIf config.gnome.enable 
   {
      # enable configuration with Home-manager
      programs.dconf.enable = true;

      # Required services
      services.xserver = 
      {
         enable = true;
         displayManager.gdm.enable = true;
         desktopManager.gnome.enable = true;
         desktopManager.xterm.enable = false;
      };

      # Included Packages & Extension
      environment.systemPackages = (with pkgs; 
      [
         gnome-tweaks
         gnome-settings-daemon
      ]) ++ (with pkgs.gnomeExtensions;
      [
         appindicator
      ]);
      

      # Excluded Packages
      environment.gnome.excludePackages = with pkgs; 
      [
         gnome-tour
         epiphany
         geary
         tali 
         iagno
         hitori
         atomix
         yelp
         gnome-contacts
         gnome-initial-setup
         gnome-weather
         gnome-maps
         xterm
      ];         
   };
}
