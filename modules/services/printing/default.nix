{ lib, pkgs, ... }:
{
  imports = 
  [
    ./printing.nix
    ./printerSharing.nix
  ];
  
  printing.enable = lib.mkDefault false;
  printerSharing.enable = lib.mkDefault false;
}
