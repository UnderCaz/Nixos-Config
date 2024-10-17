{ lib, pkgs, ... }:
{
  imports = 
  [
    ./amdgpu.nix
    ./nvidiagpu.nix
  ];
}
