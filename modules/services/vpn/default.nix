{ lib, pkgs, ... }:
{
   imports = 
   [
      ./tailscale.nix
   ];
   
   tailscale.enable = lib.mkDefault false;
}
