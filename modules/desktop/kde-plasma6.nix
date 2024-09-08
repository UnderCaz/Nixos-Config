{ lib, config, pkgs, ... }: 
{
  options = 
  {
    kde-plasma6.enable = lib.mkEnableOption "enables kde-plasma6";
  };

  config = lib.mkIf config.kde-plasma6.enable 
  {
    # Enable kde-plasma6
    services.desktopManager.plasma6.enable = true;
    # Enable sddm and configure it for pure wayland session
    services.displayManager.sddm = 
    {
      enable = true;
      wayland.enable = true;
    };
  };
}
