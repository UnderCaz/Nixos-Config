{ config, lib, pkgs, ... }:
{
  options.pipewire =
  {
    enable = lib.mkEnableOption "enables pipewire service";
    # lowlatency.enable = mkEnableOption "enables low latency"; # will experiment later
  };
    
  config = lib.mkIf config.pipewire.enable
  {
    # rtkit is optional but recommended
    security.rtkit.enable = true;

    services.pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      #jack.enable = true; # For jack support
    };

    # Low latency
  };
}
