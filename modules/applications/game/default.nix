{ lib, pkgs, ... }:
{
  imports = 
  [
    ./steam.nix
    ./protonge.nix
    ./gamemode.nix
  ];
 
  steam.enable = lib.mkDefault false;
  protonge.enable = lib.mkDefault false;
  gamemode.enable = lib.mkDefault false;
}
