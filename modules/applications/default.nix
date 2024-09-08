{ lib, pkgs, ... }:
{
  imports = 
  [
   ./game
   ./browsers
   ./kdeconnect.nix
   ./blender.nix
  ];
   
  kdeconnect.enable = lib.mkDefault false;
  blender.enable = lib.mkDefault false;
}
