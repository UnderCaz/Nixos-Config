{ config, lib, pkgs, ... }:
{
  options = 
  {
    protonge.enable = lib.mkEnableOption "enables protonge";
  };
  
  config = lib.mkIf config.protonge.enable 
  {
    # A convenient way of installing protonGE
    environment.systemPackages = with pkgs; [ protonup ];
    # Don't forget to run protonup afterwards!
  
    # install path
    environment.sessionVariables = 
    {
      STEAM_EXTRA_COMPAT_TOOLS_PATHS = "/home/user/.steam/root/compatibilitytools.d";
    };
  };
}
