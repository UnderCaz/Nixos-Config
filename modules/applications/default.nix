{ lib, pkgs, ... }:
{
  imports = 
  [
   ./editor
   ./game
   ./kdeconnect.nix
  ];
   
  kdeconnect.enable = lib.mkDefault false;
}
