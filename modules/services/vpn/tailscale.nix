{ config, lib, pkgs, ... }:
{
   options = 
   {
      tailscale.enable = lib.mkEnableOption "enables tailscale";
   };

   config = lib.mkIf config.tailscale.enable 
   {
      services.tailscale.enable = true;
   };
}
