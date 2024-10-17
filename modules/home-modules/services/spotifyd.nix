{ config, lib, pkgs, ... }: 
{ 
  options.spotifyd.enable = lib.mkEnableOption "enables spotifyd";

  config = lib.mkIf config.spotifyd.enable 
  {
    services.spotifyd = 
    {
      enable = true;
      settings = 
      {
	global = 
	{
	  username = ${spotifyUser};
	  password = ${spotifyPassword}; # This needs to be a secret ngl 
	};
      };
    };
  };
}
