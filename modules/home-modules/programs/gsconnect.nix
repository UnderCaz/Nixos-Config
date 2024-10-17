{ inputs, lib, pkgs, ... }:
{
  options =
  {
    gsconnect.enable = lib.mkEnableOption "enables gsconnect";

    user =  lib.mkOption
    {
      description = "user";
      type = lib.types.str;
      default = "user";
    };
  };

  config = lib.mkIf config.gsconnect.enable 
  {
    home-manager.users.${user}.programs.gnome-shell = 
    {
      enable = true;
      extensions = [{ package = pkgs.gnomeExtensions.gsconnect; }];
    };

    networking.firewall = 
    rec{
      allowedTCPPortRanges = [ { from = 1714; to = 1764; } ];
      allowedUDPPortRanges = allowedTCPPortRanges;
    };
  };
}
    
