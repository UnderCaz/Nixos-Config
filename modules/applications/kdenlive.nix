{ config, lib, pkgs, ... }:
{
  options = 
  {
    kdenlive.enable = lib.mkEnableOptions "enables kdenlive";
  };
  
  config = lib.mkIf config.kdenlive.enable 
  {
    environement.systemPackages = with pkgs; [ kdePackages.kdenlive ];
  };
};
