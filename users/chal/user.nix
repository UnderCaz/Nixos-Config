{ config, inputs, ... }:
let
  user = "chal";
  home = "/home/chal";
  nixhome = ./home.nix;
  # User(systems-wide) modules
  config = 
  {
    # allows the search and instalation of unfree packages for this user
    allowUnfree = true;

    gnome.enable = true;
    flatpak.enable = true;
    gsconnect.enable = true;
  };
in{
  # Imports
  imports = 
  [ 
    inputs.home-manager.nixosModules.home-manager
  ];
  # Location
  time.timezone = "Africa/Johannesburg";
  # Module information
  inherit user;
  # User
  users.users.${user} =
  {
    description = "Caz? maybe";
    isNormalUser = true;
    inherit home;
    extraGroups = [ "wheel" "networkmanager" ];
    openssh.authorizedKeys.keys = 
    [ 
    ]; 
    initialHashedPassword = "password";
  };
  # Home-manager
  home-manager =
  {
    extraSpecialArgs = { inherit inputs; };
    users =
    {
      modules = 
      [
	nixhome
	{
	  # Configures this here instead of in home.nix
	  home.username = ${user};
	  home.directory = ${home};
	}
    };
  };
  # system
  inherit config;
}
