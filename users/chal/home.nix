{ config, pkgs, ... }:

{
  imports = 
  [
    ./git.nix
    ./nixvim.nix
    ./gnomeExtensions.nix
  ];

  home.username = "chal";
  home.homeDirectory = "/home/chal";

# Packages
  home.packages =  with pkgs;
  [
    firefox
    remmina
  ];

# Dotfiles
  home.file = 
  {
  };

# Env Variables
  home.sessionVariables = 
  {
  };

  programs.home-manager.enable = true;

  home.stateVersion = "24.05"; 
}
