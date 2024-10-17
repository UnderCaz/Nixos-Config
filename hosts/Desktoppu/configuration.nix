{ config, lib, pkgs, ... }:

{
  # Boot Loader
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  # Nixos
  system.stateVersion = "24.05"; # DO NOT DELETE 
}

