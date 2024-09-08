{ config, lib, pkgs, ... }:

{

  imports =
    [ 
      ./hardware-configuration.nix
      ../../modules/default.nix
      ../../users/chal/user.nix
    ];

  kde-plasma6.enable = true;
  amdgpu.enable = true;
  pipewire.enable = true;
  
  steam.enable = true;
  protonge.enable = true;
  gamemode.enable = true;
  
  firefox.enable = true;
  blender.enable = true;
  kdeconnect.enable = true;
  kdenlive.enable = true;
  
  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  # Boot Loader
   boot.loader.systemd-boot.enable = true;
   boot.loader.efi.canTouchEfiVariables = true;

  # Networking 
   networking.hostName = "Desktoppu";   
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
	# Allow Unfree
   nixpkgs.config.allowUnfree = true;

  system.stateVersion = "24.05"; # DO NOT DELETE 
}

