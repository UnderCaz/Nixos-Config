{ config, lib, pkgs, ...}:
{
  options.spotify.enable = lib.mkEnableOption "enables spotify";

  config = lib.mkIf config.spotify.enable 
  {
    nixpkgs.config.allowUnfreePredicate = pkg: 
      builtins.elem (lib.getName pkgs) 
      [
	"spotify"
      ];
    # This may or may not be neccesary 
    environment.systemPackages = with pkgs; 
    [
      spotify
    ]; 

    # Local discovery 
      # Device syncing
    networking.firewall.allowedTCPPorts = [ 57621 ];
      # Casting
    networking.firewall.allowedUDPPorts = [ 5353 ];
  };
}
