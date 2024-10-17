{ config, lib, pkgs, ... }:
{
  options = 
  {
    printing.enable = lib.mkEnableOption "enables and configures printing";
  };
  
  config = lib.mkIf config.printing.enable
  {
    # Required services
    services = 
    {
      # CUPS 
      printing.enable = true;
     
      # Auto-detect network printers
      avahi =
       {
         enable = true;
         nssmdns4 = true;
         openFirewall = true;
       };
      
      # Drivers for printers
      printing.drivers = with pkgs;
      [
        gutenprint 
        gutenprintBin 
        hplip 
        hplipWithPlugin 
        postscript-lexmark 
        samsung-unified-linux-driver
        splix
        brlaser
        brgenml1lpr
        cnijfilter2
      ];
    };
  };
}
