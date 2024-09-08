{ lib, pkgs, ... }:
{
  imports = 
  [
   ./kde-plasma5.nix
   ./kde-plasma6.nix
  ];
  
  kde-plasma5.enable = lib.mkDefault false;
  kde-plasma6.enable = lib.mkDefault false;
}

