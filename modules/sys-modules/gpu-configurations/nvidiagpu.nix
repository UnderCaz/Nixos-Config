{ config, lib, pkgs, ... }:
{
  options = 
  {
    nvidiagpu.enable = lib.mkEnableOption "enables nvidiagpu";
  }; 

  config = lib.mkIf config.nvidiagpu.enable
  {
    # Set nvidia driver for Xserver and Wayland
    services.xserver.videoDrivers = ["nvidia"];

    # Vulkan
    hardware.graphics = 
    {
      enable = true;
      enable32Bit = true;
    };

    # Configure nvidia 
    hardware.nvidia = 
    {
      modesetting.enable = true; # Required
      powerManagement.enable = false; # Experimental
      powerManagement.finegrained = false; # Only works on Turing+ gpus
      open = false; # Buggy and experimental
      # Enable nvidia settings menu
      nvidiaSettings = true; 
      # Driver
      package = config.boot.kernelPackages.nvidiaPackages.stable;
    };
  };
}
