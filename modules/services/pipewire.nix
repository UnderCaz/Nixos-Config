{ config, lib, ... }:
{ 
  options = 
  {
    pipewire.enable = lib.mkEnableOption "enables pipewire";
  };
  
  config = lib.mkIf config.pipewire.enable 
  {
    # Enable rtkit (optional)
    security.rtkit.enable = true;
    # Enable pipewire service
    services.pipewire = {
      enable = true;
      # Enable support 
      alsa = { enable = true; support32Bit = true; };
      pulse.enable= true;
      # Enable jack support 
      #jack.enable =true;
    };
  };
}
