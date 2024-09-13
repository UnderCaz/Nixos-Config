{ lib, pkgs, ... }:
{
  imports = 
  [
    ./audio
      ./vpn
    ./printing
    ./powermanagement
  ];
}
