{ config, lib, pkgs, ... }:

{
  imports =
  [
    ./configuration.nix
  ];

  amdgpu.enable = true;

  environment.systemPackages = with pkgs;
  [
  ];
}

