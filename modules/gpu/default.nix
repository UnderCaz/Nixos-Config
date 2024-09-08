{ lib, pkgs, ... }:
{
  imports = 
  [
    ./amdgpu.nix
    ./nvidiagpu.nix
  ];
   
  amdgpu.enable = lib.mkDefault false;
  nvidiagpu.enable = lib.mkDefault false;
}
