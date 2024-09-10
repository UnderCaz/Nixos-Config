{ config, lib, pkgs, ... }:
{
  options = 
  {
    printerSharing.enable = lib.mkEnableOption "enables printer sharing";
  };
   
  config = lib.mkIf config.printerSharing.enable
  {
    services.printing = {
      listenAddresses = [ "*:631" ];
      allowFrom = [ "all" ];
      browsing = true;
      defaultShared = true;
      openFirewall = true;
      };
  };
}
