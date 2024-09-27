{ inputs, ... }:
{
  imports = [ ];

  # user
  users.users.chal =
  {
    description = "Caz? maybe";

    isNormalUser = true;
    home = "/home/chal";
    extraGroups = [ "wheel" "networkmanager" ];

    openssh.authorizedKeys.keys = 
    [ 
    ]; 

    initialHashedPassword = "password";
  };
  
  # home-manager
}
