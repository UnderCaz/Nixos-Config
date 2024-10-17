{ config, lib, pkgs, ... }: 
{

  options.flatpak =
  {
    enable = lib.mkEnableOption "enables flatpaks on a user level";

    user = lib.mkOption
    {
      description = "The user flatpak will be installed in";
      # Multiple definitions cannot be merged with this type
      type = lib.types.str;
      default = "user";
    };

    profileConfiguration = lib.mkOption
    {
      description = "Where the XDG data is exported to";
      # I don't know how to do this
      type = lib.types.envVar;
      default = "export XDG_DATA_DIRS=$XDG_DATA_DIRS:/usr/share:/var/lib/flatpak/exports/share:$HOME/.local/share/flatpak/exports/share";
    };
  };

  config = lib.mkIf config.flatpak.enable 
  {
    users.users.${config.flatpak.user}.packages = with pkgs;
    [
      flatpak
      gnome.gnome-software #Optional
    ];
    # Adds flathub (This uses the global configuration file)
    systemd.services.flatpak-repo = 
    {
    wantedBy = [ "multi-user.target" ];
    path = [ pkgs.flatpak ];
    script = 
    ''
      flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
    '';
    };
  };

}
