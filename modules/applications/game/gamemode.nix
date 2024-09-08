{ config, lib, pkgs, ... }:
{
  options = 
  {
    gamemode.enable = lib.mkEnableOption "enable gamemode";
  };
  
  config = lib.mkIf config.gamemode.enable
  {
    programs.gamemode.enable = true;
  };
}
