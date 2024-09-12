{ pkgs, ... }:
{
   programs.git =
   {
      enable = true;
   
      userName = "Caz";
      userEmail =  "csbotha10@gmail.com";
      
      extraConfig = 
      {
         init.defaultBranch = "main";
      };
   };
}
