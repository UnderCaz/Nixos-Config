{ lib, pkgs, ... }:
{
  imports = 
  [
   ./game
   ./kdeconnect.nix
   ./nixvim.nix
  ];
   
  kdeconnect.enable = lib.mkDefault false;
  nixvim.enable = lib.mkDefault true;
}
