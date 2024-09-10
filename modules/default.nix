{ pkgs, lib, ... }:
{
  imports = 
  [
    ./services
    ./gpu
    ./desktop
    ./applications
  ];
}
