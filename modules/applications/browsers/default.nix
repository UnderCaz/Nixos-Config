{ lib, pkgs, ... }:
{
  imports = 
  [
    ./firefox.nix
    ./chrome.nix
  ];
  
  firefox.enable = lib.mkDefault false;
  chrome.enable = lib.mkDefault false;
}
