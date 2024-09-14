{ config, lib, pkgs, ... }:

{
  # Boot Loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Networking 
  networking.hostName = "Javetoppu";   
  networking.networkmanager.enable = true;    

  # Time Zone
  time.timeZone = "Africa/Johannesburg";

  # Packages
  environment.systemPackages = with pkgs; 
  [  
    discord
    whatsapp-for-linux
    blender
      kdenlive
      obs-studio
  ];

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

