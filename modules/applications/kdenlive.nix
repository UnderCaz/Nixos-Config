{ config, lib, pkgs, ... }:
{
  options = 
  {
    kdenlive.enable = lib.mkEnableOption "enables kdenlive";
  };
  
  config = lib.mkIf config.kdenlive.enable 
  {
    environment.systemPackages = with pkgs; [ kdePackages.kdenlive ];
  };
}
