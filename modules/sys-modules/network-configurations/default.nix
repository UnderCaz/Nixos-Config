{ lib, ... }:
{
  imports = 
  [
    ./networkmanager.nix
  ];

  networkmanager.enable = lib.mkDefault true;
}
