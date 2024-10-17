{ lib, pkgs, ... }:
{
  imports = 
  [
    ./printing.nix
    ./printerSharing.nix
  ];
}
