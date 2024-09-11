{ config, lib, pkgs, ... }:
{
  options =
  {
    gnome.enable = lib.mkEnableOption "enables gnome";
  };
 
  config =
  {
    # Required Services
    services = lib.mkIf config.gnome.enable  
    {
      xserver = 
      {
        # Enable xserver
        enable = true;
        # Enable gdm
        displayManager.gdm.enable = true;
        # Enable gnome
        desktopManager.gnome.enable = true;
      };
   };
 };
}
