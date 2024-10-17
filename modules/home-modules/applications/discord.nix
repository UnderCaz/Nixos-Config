{ config, lib, pkgs, ...}:
{
  options.discord =
  {
    enable = lib.mkEnableOption "enables discord";
    enableBetterDiscord = lib.mkEnableOption "installs betterdiscord"; # This will be a script
    enableVencord = lib.mkEnableOption "replaces discord with vencord"; # I don't know how to add this yet 
  }; 

  config = lib.mkIf config.discord.enable 
  {
    nixpkgs.config.allowUnfreePredicate = pkg:
    builtins.elem (lib.getName pkg) [
      "discord"
    ];
    #may or may not be neccessary
    environment.systemPackages = with pkgs;
    [
      # Discord
      discord
      # Enable Audio on Wayland
      vesktop # Execute using vesktop
    ]; 
  };
}
