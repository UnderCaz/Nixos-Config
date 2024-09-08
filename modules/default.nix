{ pkgs, lib, ... }:
{
  imports = 
  [
    ./services/default.nix
    ./gpu/default.nix
    ./desktop/default.nix
    ./applications/default.nix
  ];
}
