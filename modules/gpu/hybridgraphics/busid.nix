{ ... }: 
{
# note to self, this needs to be configured per machine
# LINK: https://nixos.wiki/wiki/Nvidia

  # Configuring Bus ID Values (only for the ones you have
  hardware.nvidia.prime = 
  {
    #intelBusId = "bus_id"; # Intel CPU
    #amdBusId = "bus_id"; # AMD CPU

    #nvidiaBusId = "bus_id"; # NVIDIA GPU
    #amdgpuBusId = "bus_id"; # AMD GPU
  }; 
}
