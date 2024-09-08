{ lib, pkgs, ... }:
{
  imports = 
  [
    ./pipewire.nix
  ];
  
  pipewireM.enable = lib.mkDefault true;
}
