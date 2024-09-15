{ lib, pkgs, ... }:
{
  imports = 
  [
   ./game
   ./kdeconnect.nix
  ];
   
  kdeconnect.enable = lib.mkDefault false;
}
