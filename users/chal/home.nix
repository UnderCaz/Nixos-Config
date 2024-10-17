{ config, pkgs, ... }:

{
  # Should be configuring this in user not here
  #home.username = "chal";
  #home.homeDirectory = "/home/chal";
  imports = 
  [
    ./configurations
  ];

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}
