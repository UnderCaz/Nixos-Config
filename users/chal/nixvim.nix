{ inputs, lib, self, pkgs, ... }:
{
   imports = 
   [
      inputs.nixvim.homeManagerModules.nixvim
   ];

   programs.nixvim = 
   {
      enable = true;
      enableMan = true;
      defaultEditor = true;
      
      colorschemes.catppuccin.enable = true;
      
      plugins =
      {
         lsp =
         {
            servers = 
            {
               nixd.enable = true;
               rust-analyzer =
               {
                  enable = true;
                  installCargo = true;
                  installRustc = true;
               };
               java-language-server.enable = true;
            };
         };
      };
      
      globals.mapleader = " ";
      opts =
      {
         number = true;
         relativenumber = true;
         
         shiftwidth = 2;
      };
   };
}
