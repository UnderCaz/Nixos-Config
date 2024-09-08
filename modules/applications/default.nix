{ lib, pkgs, ... }:
{
  imports = 
  [
   ./game
   ./browsers
   ./kdeconnect.nix
   ./blender.nix
   ./kdenlive.nix
  ];
   
  kdeconnect.enable = lib.mkDefault false;
  kdenlive.enable = lib.mkDefault false;
  blender.enable = lib.mkDefault false;
}
