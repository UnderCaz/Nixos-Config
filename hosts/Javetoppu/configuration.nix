{ config, lib, pkgs, ... }:

{
  imports = [ ../../users/jave/user.nix ]; 
  
  nvidiagpu.enable = true;
  pipewire.enable = true;
  gnome.enable = true;
  
  steam.enable = true;
  gamemode.enable = true;
  protonge.enable = true;
  
  blender.enable = true;
  kdenlive.enable = true;
  kdeconnect.enable = true;
  firefox.enable = true;

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
    vim
    vesktop
    whatsapp-for-linux
  ];
   
  # Allow Unfree
  nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

