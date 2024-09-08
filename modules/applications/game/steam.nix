{ config, lib, pkgs, ... }:
{
  options = 
  {
    steam.enable = lib.mkEnableOption "enables steam";
  };
  
  config = lib.mkIf config.steam.enable 
  {
    programs.steam = 
    {
      enable = true;
  
      remotePlay.openFirewall = true; 
      localNetworkGameTransfers.openFirewall = true; 
 
      gamescopeSession.enable = true;
    };
    
    environment.systemPackages = with pkgs; [ steam-run ];
  };
}
