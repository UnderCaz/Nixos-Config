{ config, lib, pkgs, ... }:

{
  imports =
  [ 
    ./hardware-configuration.nix
    ../../modules/default.nix
    ../../users/chal/user.nix
  ];

  pipewire.enable = true;
  kde-plasma6.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot Loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking 
  networking.hostName = "Laptoppu";   
  networking.networkmanager.enable = true;    

  # Time Zone
  time.timeZone = "Africa/Johannesburg";

  # Packages
  environment.systemPackages = with pkgs; 
  [ 
  ];
   
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

