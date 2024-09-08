{ config, lib, pkgs, ... }: 
{
  options = 
  {
   kde-plasma5.enable = lib.mkEnableOption "enables kde-plasma5";
  };

  config = lib.mkIf config.kde-plasma5.enable
  {
    # Enable Xserver
    services.xserver.enable = true;
    # Enable sddm
    services.displayManager.sddm.enable = true;
    # Enable kde-plasma5
    services.xserver.desktopManager.plasma5.enable = true;
  };
}
