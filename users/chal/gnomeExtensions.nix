{ pkgs, ... }:
{
   dconf = 
   {
      enable = true;
      settings = 
      {
         "org/gnome/shell" = 
         {
            disable-user-extensions = false; # enables user extensions
            enabled-extensions = with pkgs.gnomeExtensions; 
            [
               appindicator.extensionUuid
            ];
         };
      };
   };
}
