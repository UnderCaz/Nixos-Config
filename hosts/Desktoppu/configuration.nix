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
     whatsapp-for-linux
     obs-studio
     discord
     blender
     blender-hip
     kdenlive
   ];

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

