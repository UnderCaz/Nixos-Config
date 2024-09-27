{ config, pkgs, ... }:

{
  home.username = "chal";
  home.homeDirectory = "/home/chal";

  home.packages = [
  ];

  home.file = {
  };

  home.sessionVariables = {
  };

  programs.home-manager.enable = true;
  home.stateVersion = "24.05"; 
}
