{ config, lib, pkgs, ... }:
{
  options = 
  {
    kdeconnect.enable = lib.mkEnableOption "enables kdeconnect";
  };
  
  config = lib.mkIf config.kdeconnect.enable 
  {
    programs.kdeconnect.enable = true;
  };
}
