{ config, lib, pkgs, ... }:
{
  options = 
  {
    xfce.enable = lib.mkEnableOption "enables xfce";
  };

  config = lib.mkIf config.xfce.enable 
  {
    services.xserver =
    {
      enable = true;
      desktopManager =
      {
        xterm.enable = false;
        xfce.enable = true;
      };
    };
    
    services.displayManager.defaultSession = "xfce";
  };
}
