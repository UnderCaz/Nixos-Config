{ config, lib, pkgs, ... }:
{
  options = 
  {
    chrome.enable = lib.mkEnableOption "enable chrome";
  };
  
  config = lib.mkIf config.chrome.enable 
  {
    environment.systemPackages = with pkgs; [ google-chrome ];
  };
}
