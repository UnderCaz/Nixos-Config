{ config, lib, pkgs, ...}:
{
  options =
  {
    networkmanager.enable = lib.mkEnableOption "Enables NetworkManager";
  };

  config = lib.mkIf config.networkmanager.enable 
  {
    networking.NetworkManager.enable = true;
  };
}
