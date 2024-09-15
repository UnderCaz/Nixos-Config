{ inputs, config, lib, pkgs, ... }:
{
   options =   
   {
      nixvim.enable = lib.mkEnableOption "enables nixvim";
   };

   config = lib.mkIf config.nixvim.enable 
   {
   };
}
