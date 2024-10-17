# Imports all the sys-modules
{ ... }: 
{
  imports = 
  [
    ./gpu-configurations
    ./audio-configurations
    ./network-configurations
    ./pw-configurations
  ];
}

