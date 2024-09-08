{ lib, pkgs, ... }:
{
  imports = 
  [
    ./pipewire.nix
  ];
  
  pipewire.enable = lib.mkDefault true;
}
