#!/bin/sh 
pushd $HOME/.dotfiles
  rm hardware-configuration.nix
  nix-shell -p git --command "git pull https://github.com/UnderCaz/Nixos-Config"
popd
