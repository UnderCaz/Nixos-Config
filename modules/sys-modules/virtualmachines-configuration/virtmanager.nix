{ config, lib, pkgs, ... }: 
{
  options.virtmanager =
  { 
    enable = lib.mkEnableOption "enable virtmanager"; 
  }; 


  config = lib.mkIf config.virtmanager.enable
  { 
    # Only for after 23.11
    virtualisation.libvirtd.enable = true;
    programs.virt-manager.enable = true;
    # Error can be resolved through home-manager
    # User must be added to the libvirtd group for 
    # Networking must be setup in the cli, virsh net-autostart default
  }; 
}
