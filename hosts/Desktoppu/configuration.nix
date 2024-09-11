{ config, lib, pkgs, ... }:

{
  # Boot Loader
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;

  # Networking 
   networking.networkmanager.enable = true;    
  # Time Zone
   time.timeZone = "Africa/Johannesburg";
  # Packages
   environment.systemPackages = with pkgs; [ 
     vim 
     wget
     netbeans
     openjdk17-bootstrap
     vesktop
     whatsapp-for-linux
     obs-studio
     git
   ];

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

