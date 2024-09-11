{ lib, pkgs, ... }:
{
  imports = 
  [
   ./kde-plasma5.nix
   ./kde-plasma6.nix
   ./gnome.nix
   ./xfce.nix
  ];
  
  kde-plasma5.enable = lib.mkDefault false;
  kde-plasma6.enable = lib.mkDefault false;
  
  gnome.enable = lib.mkDefault false;
  
  xfce.enable = lib.mkDefault false;
}

