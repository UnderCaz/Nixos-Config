{ pkgs, ... }:
{
   gtk =   
   {
      enable = true;
      
      cursorTheme.name = "Bibata-Modern-Ice";
      cursorTheme.package = pkgs.bibata-cursors;

      theme.name = "adw-gtk3";
      theme.package = pkgs.adw-gtk3;
   };
   
   qt =
   {
      enable = true;
      platformTheme.name = "gtk";
      style.name = "adwaita";
      
      style.package = pkgs.adwaita-qt;
   };
}
