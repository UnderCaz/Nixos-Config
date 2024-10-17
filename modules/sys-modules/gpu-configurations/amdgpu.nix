{ config, lib, pkgs, ... }:
{
  options = 
  {
    amdgpu.enable = lib.mkEnableOption "enables amdgpu";
  };
  
  config = lib.mkIf config.amdgpu.enable  
  {
    # Sets the gpu driver for the kernel
    boot.initrd.kernelModules = [ "amdgpu" ];

    # Sets the gpu driver for Xserver
    services.xserver.videoDrivers = [ "amdgpu" ];

    # Vulkan
    hardware.graphics = 
    {
      # Enables openGL
      enable = true; 
      # Enables support for 32 bit applications
      enable32Bit = true;
    };

    # Packages
    environment.systemPackages = with pkgs; [ clinfo ]; # Checks if OpenCL is working correctly
    hardware.graphics = 
    {
      extraPackages = 
      with pkgs; 
      [
        # OpenCL
        rocmPackages.clr.icd 
        # AMDVLK
        #amdvlk # rather use RADV the default
      ];
      extraPackages32 =
      with pkgs;
      [
        # AMDVLK
        #driversi686Linux.amdvlk
      ];
    };

    # Directs applications to use HIP libraries from the rocm packages
    systemd.tmpfiles.rules = 
    [
      "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
    ];
  };
}
