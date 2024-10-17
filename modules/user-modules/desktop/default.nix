{ lib, pkgs, ... }:
{
  imports = 
  [
   ./kde-plasma5.nix
   ./kde-plasma6.nix
   ./gnome.nix
   ./xfce.nix
  ];
}

