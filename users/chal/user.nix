{ ... }:
{
  users.users = 
  {
    chal = 
    {
      isNormalUser = true;
      extraGroups = [ "wheel" "networkmanager" ];
    };
  };
}
