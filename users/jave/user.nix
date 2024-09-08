{ ... }:
{
  users.users = 
  {
    jave = 
    {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
